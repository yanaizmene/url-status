# frozen_string_literal: true

RSpec.describe URLStatus::Formatters::CSV do
  describe '#display_results' do
    it 'returns responses in csv format' do
      responses = [
        double(
          url: 'http://google.com',
          available?: true,
          http_code: '200',
          http_message: 'OK'
        ),
        double(
          url: 'http://invalid.url',
          available?: false,
          http_code: '404',
          http_message: 'Not Found'
        )
      ]

      expected = "URL,Available?,Status\n" \
                 "http://google.com,YES,200 OK\n" \
                 "http://invalid.url,NO,404 Not Found\n"
      expect(described_class.new(responses).display_results).to eq(expected)
    end
  end
end
