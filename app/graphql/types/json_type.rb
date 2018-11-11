module Types
  class JsonType < Types::BaseScalar
    description "A valid URL, transported as a string"

    def self.coerce_input(input_value, context)
      binding.pry
      JSON.parse(input_value)
    end

    def self.coerce_result(ruby_value, context)
      JSON.dump(ruby_value)
    end
  end
end
