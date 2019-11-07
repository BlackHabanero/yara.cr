class Yara::RulesManager

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
