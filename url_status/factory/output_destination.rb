# frozen_string_literal: true

module URLStatus
  module Factory
    module OutputDestination
      module_function

      def produce(destination)
        case destination
        when 'STDOUT'
          STDOUT
        else
          ::File.open(destination, 'w')
        end
      end
    end
  end
end
