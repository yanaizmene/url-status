# frozen_string_literal: true

module URLStatus
  module Formatters
    class CSV < Formatter
      def display_results
        ::CSV.generate do |csv|
          csv << ['URL', 'Available?', 'Status']
          format_responses.each { |response| csv << response }
        end
      end

      private

      def format(response)
        decorator = Decorator::NetHTTPResponse.new(response)
        [
          decorator.url,
          decorator.availability,
          decorator.http_code_and_message
        ]
      end
    end
  end
end
