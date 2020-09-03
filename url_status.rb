# frozen_string_literal: true

require 'bigdecimal'
require 'colorize'
require 'progress_bar'
require 'terminal-table'

require File.expand_path('url_status/configuration.rb', File.dirname(__FILE__))
require File.expand_path('url_status/file.rb', File.dirname(__FILE__))
require File.expand_path('url_status/checker.rb', File.dirname(__FILE__))
require File.expand_path('url_status/url.rb', File.dirname(__FILE__))
require File.expand_path('url_status/factory.rb', File.dirname(__FILE__))
require File.expand_path('url_status/formatters.rb', File.dirname(__FILE__))
require File.expand_path('url_status/decorator.rb', File.dirname(__FILE__))

module URLStatus
  def self.run(filepath)
    urls = File::CSV.new(filepath, headers: config.ignore_first_csv_row).parse
    progress = Factory::ProgressBar.produce(
      urls.count, config.show_progress
    )
    checked_urls = check_urls(urls, progress)
    write_result(checked_urls)
  end

  def self.check_urls(urls, progress)
    urls.map! do |url|
      checked_url = URL.build(url)
      progress.increment!
      checked_url
    end
  end

  def self.write_result(urls)
    formatter = Factory::Formatter.produce(config.format, urls)
    destination = Factory::OutputDestination.produce(
      config.output_path
    )
    destination.write(formatter.display_results)
  end
end
