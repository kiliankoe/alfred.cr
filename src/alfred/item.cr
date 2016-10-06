require "json"

module Alfred
  class Item
    JSON.mapping(
      uid: String | Nil,
      title: String,
      subtitle: String | Nil,
      arg: String | ComplexArg | Nil,
      icon: Icon | Nil,
      valid: Bool | Nil,
      autocomplete: String | Nil,
      type: String | Nil,
      mods: Hash(String, Mod) | Nil,
      text: Text | Nil,
      quicklookurl: String | Nil,
    )

    def initialize
      @title = ""
    end

    def initialize(&block)
      @title = ""
      yield self
    end

    def add_mod(key : ModKey, mod : Mod)
      mods = @mods
      if mods.nil?
        mods = {key.to_s => mod}
      else
        mods[key.to_s] = mod
      end
      @mods = mods
    end
  end

  enum ItemType
    Default
    File
    FileSkipCheck

    def to_s
      case self
      when Default
        "default"
      when File
        "file"
      when FileSkipCheck
        "file:skipcheck"
      end
    end
  end
end
