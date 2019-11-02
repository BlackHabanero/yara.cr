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
      unless LibYara.finalize == 0
        raise YaraException.new("Cannot finalize libyara")
      end
    end
  end

  class Compiler
    def initialize
    end
    def add_file
    end
    def add_file_descriptor
    end
    def add_string
    end
    def define_var
    end
    def compile
    end
    def finalize
    end
  end

  class YaraException < Exception
  end
end
