class Yara::Scanner
  @box : Pointer(Void)?
  @output : Hash(String, Bool)

  def initialize(@print_output : Bool = false, @refresh_scan_result : Bool = true)
    @output = Hash(String, Bool).new
  end

  def scan(rules, fd : Int32, timeout : Int32 = 0) : Nil
    @output.clear if @refresh_scan_result
    STDOUT.puts "yara.cr: Scanning of #{fd} started" if @print_output

    @box = Box.box(->callback_endpoint(Int32, Void*))
    callbee = ->(message : LibC::Int, msg_data : Void*, usr_data : Void*) {
      data_as_callback = Box(Proc(Int32, Pointer(Void), Int32)).unbox(usr_data)
      data_as_callback.call(message, msg_data)
    }

    unless LibYara.rules_scan_fd(rules, fd, 0, callbee, @box, timeout) == 0
      raise YaraException.new("Cannot scan file descriptor: #{fd}")
    end
  end

  def scan(rules, file : File, timeout : Int32 = 0)
    scan(rules: rules, fd: file.fd, timeout: timeout)
  end

  private def callback_endpoint(message : Int32, msg_data :  Void*) : Int32
    if msg_data
      unless message > LibYara::Callback_Message::CALLBACK_MSG_RULE_NOT_MATCHING.value
        rulename = String.new(msg_data.as(LibYara::YrRule*).value.identifier)

        if message == LibYara::Callback_Message::CALLBACK_MSG_RULE_MATCHING.value
          matches = true
        else
          matches = false
        end

        @output[rulename] = matches
        STDOUT.puts "yara.cr: #{rulename} matches? #{matches.to_s.capitalize}" if @print_output
      end

    else
      STDOUT.puts "yara.cr: Scanning completed" if @print_output
    end
    LibYara::Callback_Return::CALLBACK_CONTINUE.value
  end

  def get_scan_result : Hash(String, Bool)
    return @output
  end
end
