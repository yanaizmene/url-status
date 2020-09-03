# frozen_string_literal: true

RSpec.describe URLStatus::Decorator::Colored do
  it 'conforms NetHTTPResponse interface' do
    response = double(url: 'http://google.com', http_code: 201)
    decorated = URLStatus::Decorator::NetHTTPResponse.new(response)
    obj = described_class.new(decorated)
    expect(obj).to respond_to(:url)
    expect(obj).to respond_to(:availability)
    expect(obj).to respond_to(:http_code_and_message)
  end

  describe '#url' do
    context 'HTTP 200-299' do
      it 'returns obj#url in green text' do
        response = double(url: 'http://google.com', http_code: 201)
        decorated = URLStatus::Decorator::NetHTTPResponse.new(response)
        obj = described_class.new(decorated)
        expect(obj.url).to eq("\e[0;32;49m#{response.url}\e[0m")
      end
    end

    context 'HTTP 300-399' do
      it 'returns obj#url in yellow text' do
        response = double(url: 'http://google.com', http_code: 405)
        decorated = URLStatus::Decorator::NetHTTPResponse.new(response)
        obj = described_class.new(decorated)
        expect(obj.url).to eq("\e[0;33;49m#{response.url}\e[0m")
      end
    end

    context 'HTTP code is zero.' do
      it 'returns obj#url in red text' do
        response = double(url: 'http://google.com', http_code: 0)
        decorated = URLStatus::Decorator::NetHTTPResponse.new(response)
        obj = described_class.new(decorated)
        expect(obj.url).to eq("\e[0;31;49m#{response.url}\e[0m")
      end
    end

    context 'HTTP code is 5xx.' do
      it 'returns obj#url in red text' do
        response = double(url: 'http://google.com', http_code: 503)
        decorated = URLStatus::Decorator::NetHTTPResponse.new(response)
        obj = described_class.new(decorated)
        expect(obj.url).to eq("\e[0;31;49m#{response.url}\e[0m")
      end
    end
  end
end
