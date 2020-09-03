# frozen_string_literal: true

require 'optparse'

option_parser = OptionParser.new do |opts|
  opts.banner = 'Usage: start path-to.csv'
  opts.on(
    '-o',
    '--output=destination',
    'STDOUT or path to file to write to. Default STDOUT.'
  ) do |output_path|
    URLStatus.config.output_path = output_path
  end

  opts.on(
    '-f',
    '--format=format',
    'Desireable format. csv or pretty. Default is pretty.'
  ) do |format|
    URLStatus.config.format = format
  end

  opts.on('-s', '--no-progress-bar', 'Disable progress bar') do
    URLStatus.config.show_progress = false
  end

  opts.on(
    '--no-ignore-first-csv-row',
    'Do not ignore header row in csv file. Ignored by default.'
  ) do
    URLStatus.config.ignore_first_csv_row = false
  end

  opts.on('-h', '--help', 'Prints this help') do
    puts opts
    exit
  end
end

option_parser.parse!
