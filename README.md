# yara.cr

Crystal bindings to [VirusTotal Yara](https://github.com/VirusTotal/yara) pattern matching tool aimed at helping malware researchers to identify and classify malware samples.

![](https://github.com/BlackHabanero/yara.cr/workflows/Crystal%20CI/badge.svg)

## Prerequisites

This library requires libyara to run (latest version known to work - 3.11).
You can install libyara from [source](https://github.com/VirusTotal/yara) to ensure you have the most recent version up and running.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     yara:
       github: BlackHabanero/yara.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "yara"
```

1. Initialize `Yara::Yara` (doing it more than once can cause undefined behaviour)
   ```crystal
   yara = Yara::Yara.new
   ```
   
2. Usage of `Yara::Compiler`
   ```crystal
   compiler = Yara::Compiler.new
   # add_input_src is used for passing rules to compile
   compiler.add_input_src(var) # var of type File, Int32 (file descriptor) or String
   # add_external_var is used for passing external variables defined in the rules
   compiler.add_external_var(id, var) # id of type String, var of type Bool, Float64, String, LibC::Long
   rules = compiler.compile # Returned object can be used for scanning
   
3. Usage of `Yara::RulesManager`
   ```crystal
   # This class cannot be instantiated (it would be useless)
   
   # Stores compiled rules in a file
   Yara::RulesManager.save_rules(filename, rules) # rules object is the one that Yara::Compiler.compile returns
   # Loads rules that were compiled and stored in a file
   loaded_rules = Yara::RulesManager.load_rules(filename)
   # You should do this when You're done working with rules object
   Yara::RulesManager.destroy_rules(rules)
   # You can change external variable value with this one
   RulesManager.add_external_var(rules, id, var) # id of type String, var of type Bool, Float64, String, LibC::Long
   ```
4. Usage of `Yara::Scanner`
   ```crystal
   # Both args of type Bool, first is self explanatory, second one makes Scanner refresh results' list before next scan
   scanner = Yara::Scanner.new(print_output, refresh_scan_result)
   # This is used for scanning data
   scanner.scan(rules, data) # data of type File or Int32 (file descriptor)
   # get_scan_result returns Hash(String, Bool) with rulename and true / false depending on whether the data matches the rule
   output = scanner.get_scan_result

## Contributing

1. Fork it (<https://github.com/BlackHabanero/yara.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [BlackHabanero](https://github.com/BlackHabanero) - creator and maintainer
