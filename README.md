# 🎩 alfred.cr

Create [Alfred Workflows](https://www.alfredapp.com/workflows/) in Crystal with ease.

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  alfred:
    github: kiliankoe/alfred.cr
```

## Prerequisites

You need [Alfred 3](https://www.alfredapp.com/) with the paid [Powerpack](https://www.alfredapp.com/powerpack/) upgrade.

## Usage

Here's a quick and dirty example, more documentation will be added soon 😛


```crystal
require "alfred"

item = Alfred::Item.new do |i|
  i.title = "An awesome title"
  i.subtitle = "An awesome subtitle"
  i.arg = "argument"

  mod = Alfred::Mod.new do |m|
    m.arg = "mod arg cmd"
    m.subtitle = "some other subtitle"
  end

  i.add_mod Alfred::ModKey::CMD.to_s, mod
end

Alfred.output item

# => {"items":[{"title":"An awesome title","subtitle":"An awesome subtitle","arg":"argument","mods":{"cmd":{"valid":true,"arg":"mod arg cmd","subtitle":"some other subtitle"}}}]}
```

## Contributing

1. Fork it ( https://github.com/kiliankoe/alfred.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Users

*Alfred workflows using alfred.cr*

- yours, maybe? 🙃

## Contributors

- [kiliankoe](https://github.com/kiliankoe) Kilian Koeltzsch - creator, maintainer

## Thanks

Shoutout goes to [BenchR267](https://github.com/BenchR267) with whom I explored much of Alfred's quirks ([goalfred](https://github.com/BenchR267/goalfred) came out of that 😊) and [alfy](https://github.com/sindresorhus/alfy), from which I shamelessly stole (as in *imitation is the sincerest form of flattery*) the basic API.

