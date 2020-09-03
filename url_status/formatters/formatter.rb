# frozen_string_literal: true

module URLStatus
  module Formatters
    class Formatter
      attr_reader :responses

      def initialize(responses)
        @responses = responses
      end

      def display_results
        raise 'Can not call Formatter#display_results. Use subclass instead.'
      end

      private

      def format_responses
        responses.map { |response| format(response) }
      end

      def format(_response)
        raise 'Can not call Formatter#format. Use subclass instead.'
      end
    end
  end
end
