# yara.cr

Crystal bindings to [VirusTotal Yara](https://github.com/VirusTotal/yara) pattern matching tool aimed at helping malware researchers to identify and classify malware samples.

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

TODO: Write usage instructions here

## Contributing

1. Fork it (<https://github.com/BlackHabanero/yara.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [BlackHabanero](https://github.com/BlackHabanero) - creator and maintainer
