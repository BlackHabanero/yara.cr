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
      unless LibYara.finalize == 0
        raise YaraException.new("Cannot finalize libyara")
      end
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
        result = LibYara.compiler_add_fd(@compiler, fd, namespace, filename)
        unless result == 0
          self.finalize
          raise YaraException.new("Cannot add input source to compiler: file descriptor, #{result} errors found")
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
          self.finalize
          raise YaraException.new("Cannot add input source to compiler: string, #{result} errors found")
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

  class RulesManager

    def self.load_rules(filename : String)
      unless LibYara.rules_load(filename, out rules) == 0
        raise YaraException.new("Cannot load rules from file: #{filename}")
      end
      rules
    end

    def self.save_rules(filename : String, rules)
      unless LibYara.rules_save(filename, rules) == 0
        raise YaraException.new("Cannot save rules from file: #{filename}")
      end
    end

    def self.destroy_rules(rules)
      unless LibYara.rules_destroy(rules) == 0
        raise YaraException.new("Cannot destroy rules")
      end
    end

    def self.def_external_var(rules, identifier : String, val : Bool)
      unless LibYara.rules_define_boolean_variable(rules, identifier, val) == 0
        raise YaraException.new("Cannot define variable in rules manager: boolean")
      end
    end

    def self.def_external_var(rules, identifier : String, val : Float64)
      unless LibYara.rules_define_float_variable(rules, identifier, val) == 0
        raise YaraException.new("Cannot define variable in rules manager: float")
      end
    end

    def self.def_external_var(rules, identifier : String, val : String)
      unless LibYara.rules_define_string_variable(rules, identifier, val) == 0
        raise YaraException.new("Cannot define variable in rules manager: string")
      end
    end

    def self.def_external_var(rules, identifier : String, val : LibC::Long)
      unless LibYara.rules_define_integer_variable(rules, identifier, val) == 0
        raise YaraException.new("Cannot define variable in rules manager: integer")
      end
    end
  end

  class YaraException < Exception
  end
end
