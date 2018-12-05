module Types
  class JsonType < Types::BaseScalar
    description "A valid URL, transported as a string"

    def self.coerce_input(input_value, context)
      # for some reason it sends a parameter
      input_value.as_json.deep_symbolize_keys
    end

    def self.coerce_result(ruby_value, context)
      # TODO : this hasn't been tested and should be.
      JSON.dump(ruby_value)
    end
  end
end
