require "./lib.cr"

# TODO: Write documentation for `Yara`
module Yara
  VERSION = "0.1.0"

  class Yara
    def initialize
      unless LibYara.initialize == 0
        raise YaraException.new("Cannot initialize libyara")
      end
    end
    def finalize
      LibYara.finalize
    end
  end

  class Compiler
    def initialize
      unless LibYara.compiler_create(out @compiler) == 0
        raise YaraException.new("Cannot initialize yara compiler")
      end
    end
    def add_input_src(obj : File|FileDescriptor|String)
    end
    def def_external_var(identifier : String, var : Boolean|Float64|String|LibC::Long)
    end
    def compile
    end
    def finalize
      LibYara.compiler_destroy(@compiler)
    end
  end

  class YaraException < Exception
  end
end
