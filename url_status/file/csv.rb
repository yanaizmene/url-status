# frozen_string_literal: true

require 'csv'
module URLStatus
  module File
    class CSV
      attr_reader :filepath, :options

      def initialize(filepath, options = {})
        @filepath = filepath
        @options = options
      end

      def parse
        ::CSV.foreach(filepath, options).map { |row| row[0] }
      end
    end
  end
end
