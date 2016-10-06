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

  class ComplexArg
    # FIXME: This has to wrapped in {"alfredworkflow": ComplexArg}

    JSON.mapping(
      arg: String | Nil,
      variables: Hash(String, String) | Nil,
    )

    def initialize; end

    def initialize(&block)
      yield self
    end
  end

  class Icon
    JSON.mapping(
      type: String | Nil,
      path: String,
    )

    def initialize
      @path = ""
    end

    def initialize(&block)
      @path = ""
      yield self
    end
  end

  enum IconType
    File
    FileIcon
    FileType

    def to_s
      # File omitted on purpose, as that should result in nil
      case self
      when FileIcon
        "fileicon"
      when FileType
        "filetype"
      end
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

  class Mod
    JSON.mapping(
      valid: Bool,
      arg: String,
      subtitle: String | Nil,
    )

    def initialize
      @arg = ""
      @valid = true
    end

    def initialize(&block)
      @arg = ""
      @valid = true
      yield self
    end
  end

  enum ModKey
    Command
    Option
    Control
    CMD
    ALT
    CTRL

    def to_s
      case self
      when Command, CMD
        "cmd"
      when Option, ALT
        "alt"
      else
        "ctrl"
      end
    end
  end

  class Text
    JSON.mapping(
      copy: String | Nil,
      largetype: String | Nil,
    )

    def initialize; end

    def initialize(&block)
      yield self
    end
  end
end
