require "./lib.cr"
require "./yara/*"

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
      unless LibYara.finalize == 0
        raise YaraException.new("Cannot finalize libyara")
      end
    end
  end

  class YaraException < Exception
  end
end
