require "./lib.cr"

# TODO: Write documentation for `Yara`
module Yara
  VERSION = "0.1.0"

  class Yara
    def initialize
      unless LibYara.initialize == 0
        raise YaraException.new("Cannot initialize libyara")
      end
      @finalized = false
    end
    def finalize
      @finalized = true
      LibYara.finalize
    end
  end

  class Compiler
    @finalized : Bool
    def initialize
      unless LibYara.compiler_create(out @compiler) == 0
        raise YaraException.new("Cannot initialize yara compiler")
      end
      @finalized = false
    end

    # def add_input_src(file_path : String, namespace : String = "")
    #   unless @finalized
    #     filename = File.basename(file_path)
    #     unless LibYara.compiler_add_file(@compiler, LibC.fopen(file_path, "rb"), namespace, filename) == 0
    #       raise YaraException.new("Cannot add input source to compiler: file")
    #     end
    #   else
    #     raise YaraException.new("Cannot add input source to finalized compiler")
    #   end
    # end

    def add_input_src(fd : Int32, filename : String, namespace : String = "")
      unless @finalized
        unless LibYara.compiler_add_fd(@compiler, fd, namespace, filename) == 0
          raise YaraException.new("Cannot add input source to compiler: file descriptor")
        end
      else
        raise YaraException.new("Cannot add input source to finalized compiler")
      end
    end

    def add_input_src(file : File, namespace : String = "")
      filename = File.basename(file.path)
      add_input_src(fd: file.fd, filename: filename, namespace: namespace)
    end

    def add_input_src(string : String, namespace : String = "")
      unless @finalized
        unless LibYara.compiler_add_string(@compiler, string, namespace) == 0
          raise YaraException.new("Cannot add input source to compiler: string")
        end
      else
        raise YaraException.new("Cannot add input source to finalized compiler")
      end
    end

    def def_external_var(identifier : String, var : Bool|Float64|String|LibC::Long)
    end
    def compile
      unless @finalized
      else
        raise YaraException.new("Cannot compile with finalized compiler")
      end
    end
    def finalize
      @finalized = true
      LibYara.compiler_destroy(@compiler)
    end
  end

  class YaraException < Exception
  end
end
