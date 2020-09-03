# frozen_string_literal: true

module URLStatus
  module Decorator
    class NetHTTPResponse
      attr_reader :response

      def initialize(response)
        @response = response
      end

      def url
        response.url
      end

      def availability
        response.available? ? 'YES' : 'NO'
      end

      def http_code_and_message
        [response.http_code, response.http_message].compact.join(' ')
      end
    end
  end
end
