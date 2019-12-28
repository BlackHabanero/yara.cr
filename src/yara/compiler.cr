class Yara::Compiler
  @finalized : Bool
  @errors : String

  def initialize()
    unless LibYara.compiler_create(out @compiler) == 0
      raise YaraException.new("Cannot initialize yara compiler")
    end

    @errors = ""

    @box = Box.box(->callback_endpoint(Int32, String, Int32, String))
    callbee = ->(error_level : LibC::Int, file_name : LibC::Char*, line_number : LibC::Int, message : LibC::Char*, usr_data : Void*) {
      data_as_callback = Box(Proc(Int32, String, Int32, String, Nil)).unbox(usr_data)
      f_n = if file_name.null?
        "NULL"
      else
        String.new(file_name)
      end
      data_as_callback.call(error_level, f_n, line_number, String.new(message))
    }
    LibYara.compiler_set_callback(@compiler, callbee, @box)

    @finalized = false
  end

  private def callback_endpoint(error_lvl : Int32, file_name : String, line_number : Int32, message : String) : Nil
    if error_lvl == 0
      s = "Error"
    else
      s = "Warning"
    end
    @errors = @errors + "#{s} in #{file_name} at line #{line_number}:\n#{message}\n"
  end

  def add_input_src(fd : Int32, filename : String, namespace : String = "")
    unless @finalized
      result = LibYara.compiler_add_fd(@compiler, fd, namespace, filename)
      unless result == 0
        @finalized = true
        raise YaraException.new("Cannot add input source to compiler: file descriptor, #{result} errors found\n"+@errors)
      end
    else

      raise YaraException.new("Cannot add input source to finalized compiler")
    end
  end

  def add_input_src(file : File, filename : String = File.basename(file.path), namespace : String = "")
    add_input_src(fd: file.fd, filename: filename, namespace: namespace)
  end

  def add_input_src(string : String, namespace : String = "")
    unless @finalized
      result = LibYara.compiler_add_string(@compiler, string, namespace)
      unless result == 0
        @finalized = true
        raise YaraException.new("Cannot add input source to compiler: string, #{result} errors found\n"+@errors)
      end
    else
      raise YaraException.new("Cannot add input source to finalized compiler")
    end
  end

  def def_external_var(identifier : String, val : Bool)
    unless @finalized
      unless LibYara.compiler_define_boolean_variable(@compiler, identifier, val) == 0
        raise YaraException.new("Cannot define variable in compiler: boolean")
      end
    else
      raise YaraException.new("Cannot define variable in finalized compiler")
    end
  end

  def def_external_var(identifier : String, val : Float64)
    unless @finalized
      unless LibYara.compiler_define_float_variable(@compiler, identifier, val) == 0
        raise YaraException.new("Cannot define variable in compiler: float")
      end
    else
      raise YaraException.new("Cannot define variable in finalized compiler")
    end
  end

  def def_external_var(identifier : String, val : String)
    unless @finalized
      unless LibYara.compiler_define_string_variable(@compiler, identifier, val) == 0
        raise YaraException.new("Cannot define variable in compiler: string")
      end
    else
      raise YaraException.new("Cannot define variable in finalized compiler")
    end
  end

  def def_external_var(identifier : String, val : LibC::Long)
    unless @finalized
      unless LibYara.compiler_define_integer_variable(@compiler, identifier, val) == 0
        raise YaraException.new("Cannot define variable in compiler: integer")
      end
    else
      raise YaraException.new("Cannot define variable in finalized compiler")
    end
  end

  def compile
    unless @finalized
      unless LibYara.compiler_get_rules(@compiler, out rules) == 0
        raise YaraException.new("Cannot compile rules")
      else
        return rules
      end
    else
      raise YaraException.new("Cannot compile rules with finalized compiler")
    end
  end

  def reset
    LibYara.compiler_destroy(@compiler)
    unless LibYara.compiler_create(out @compiler) == 0
      raise YaraException.new("Cannot initialize yara compiler")
    end
  end

  def finalize
    @finalized = true
    LibYara.compiler_destroy(@compiler)
  end
end
