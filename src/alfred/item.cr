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

    def add_mod(key : String, mod : Mod)
      mods = @mods
      if mods.nil?
        mods = {key => mod}
      else
        mods[key] = mod
      end
      @mods = mods
    end
  end

  enum Type
    Default
    File
    FileSkipCheck

    def to_s
      case self
      when Type::Default
        "default"
      when Type::File
        "file"
      when Type::FileSkipCheck
        "file:skipcheck"
      end
    end
  end
end
