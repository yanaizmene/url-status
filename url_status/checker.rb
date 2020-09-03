# frozen_string_literal: true

require 'ostruct'
require 'net/http'

module URLStatus
  class Checker
    HTTP_OK = '200'

    def self.check(url)
      new.check(url)
    end

    attr_reader :uri_parser, :check_with

    def initialize(uri_parser: URI, check_with: Net::HTTP)
      @uri_parser = uri_parser
      @check_with = check_with
    end

    def check(url)
      uri = uri_parser.parse(url)
      response = check_with.get_response(uri)
      success(response)
    rescue StandardError => e
      failure(url, e)
    end

    def success(response)
      OpenStruct.new(
        url: response.uri.to_s,
        available?: response.code == HTTP_OK,
        http_code: response.code,
        http_message: response.message
      )
    end

    def failure(url, exception)
      OpenStruct.new(
        url: url,
        available?: false,
        http_message: exception.message
      )
    end
  end
end
