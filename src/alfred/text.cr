module Alfred
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
