# frozen_string_literal: true

RSpec.describe URLStatus::File::CSV do
  describe '#parse' do
    it 'returns flat array of first csv column' do
      obj = described_class.new('./spec/fixtures/domains.csv')
      expected = [
        'URL', 'raketaapp.com', 'https://site.ua/foo'
      ]
      expect(obj.parse).to eq(expected)
    end

    specify 'you can pass options to CSV.foreach' do
      obj = described_class.new(
        './spec/fixtures/domains.csv',
        headers: true
      )
      expected = ['raketaapp.com', 'https://site.ua/foo']
      expect(obj.parse).to eq(expected)
    end
  end
end
