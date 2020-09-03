# frozen_string_literal: true

module URLStatus
  module Factory
    module Formatter
      module_function

      def produce(format, responses)
        case format.downcase.to_sym
        when :pretty
          Formatters::Pretty.new(responses)
        when :csv
          Formatters::CSV.new(responses)
        else
          raise "Unknown format #{format}"
        end
      end
    end
  end
end
