# frozen_string_literal: true

module URLStatus
  module Factory
    module ProgressBar
      module_function

      def produce(count, show_progress)
        case show_progress
        when true
          ::ProgressBar.new(count)
        when false
          OpenStruct.new
        else
          raise "Unknown show_progress value #{show_progress}"
        end
      end
    end
  end
end
