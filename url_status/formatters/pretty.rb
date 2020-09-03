# frozen_string_literal: true

module URLStatus
  module Formatters
    class Pretty < Formatter
      def display_results
        Terminal::Table.new(
          headings: ['URL', 'Available?', 'Status'],
          rows: format_responses
        )
      end

      private

      def format(response)
        decorator = Decorator::Colored.new(
          Decorator::NetHTTPResponse.new(response)
        )
        [
          decorator.url,
          decorator.availability,
          decorator.http_code_and_message
        ]
      end
    end
  end
end
