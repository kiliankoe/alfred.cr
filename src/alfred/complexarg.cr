require "json"

module Alfred
  class ComplexArg
    # FIXME: This has to be wrapped in {"alfredworkflow": ComplexArg}, but how?

    JSON.mapping(
      arg: String | Nil,
      variables: Hash(String, String) | Nil,
    )

    def initialize; end

    def initialize(&block)
      yield self
    end
  end
end
