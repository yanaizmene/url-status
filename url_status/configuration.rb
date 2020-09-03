# frozen_string_literal: true

module URLStatus
  def self.config
    @configuration ||= configure
  end

  def self.configure
    @configuration ||= Configuration.new
    yield(config) if block_given?
    @configuration
  end

  class Configuration
    attr_accessor :output_path, :format, :show_progress,
                  :ignore_first_csv_row

    def initialize
      @output_path = 'STDOUT'
      @format = :pretty
      @show_progress = true
      @ignore_first_csv_row = true
    end
  end
end
