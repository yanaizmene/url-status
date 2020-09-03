# frozen_string_literal: true

module URLStatus
  module Decorator
    class Colored < SimpleDelegator
      def url
        response.url.colorize(
          color(response.http_code.to_i)
        )
      end

      private

      def color(http_code)
        if http_code.zero? || http_code > 499
          :red
        elsif http_code < 300
          :green
        elsif http_code < 500
          :yellow
        else
          :red
        end
      end
    end
  end
end
