# frozen_string_literal: true

module URLStatus
  class URL
    attr_reader :url, :checker, :available, :http_code, :http_message

    def self.build(url)
      url = "https://#{url}" unless url =~ %r{https?://}
      url = new(url)
      url.check
      url
    end

    def initialize(url, checker = Checker)
      @url = url
      @checker = checker
    end

    def check_result
      @check_result ||= checker.check(url)
    end

    def available?
      available
    end

    def check
      @available = check_result.available?
      @http_code = check_result.http_code
      @http_message = check_result.http_message
    end
  end
end
