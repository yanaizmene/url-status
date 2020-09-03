# frozen_string_literal: true

RSpec.describe URLStatus::Checker do
  describe '#check' do
    context 'when url is available' do
      it 'returns correct duck' do
        url = 'http://google.com'
        net_http = double
        response = double(
          uri: url,
          code: '200',
          message: 'OK'
        )
        allow(net_http).to receive(:get_response).and_return(response)
        obj = described_class.new(check_with: net_http)
        expected = OpenStruct.new(
          url: url,
          available?: true,
          http_code: '200',
          http_message: 'OK'
        )
        expect(obj.check(url)).to eq(expected)
      end
    end

    context 'when url is unavailable' do
      it 'returns correct duck' do
        url = 'http://google.com'
        net_http = double
        response = double(uri: url, code: '403', message: 'Forbidden')
        allow(net_http).to receive(:get_response).and_return(response)
        obj = described_class.new(check_with: net_http)
        expected = OpenStruct.new(
          url: url,
          available?: false,
          http_code: '403',
          http_message: 'Forbidden'
        )
        expect(obj.check(url)).to eq(expected)
      end
    end

    context 'when url is not responding' do
      it 'returns correct duck' do
        url = 'http://google.com'
        net_http = double
        allow(net_http).to \
          receive(:get_response)
          .and_raise(SocketError, 'Failed to connect')
        obj = described_class.new(check_with: net_http)
        expected = OpenStruct.new(
          url: url,
          available?: false,
          http_message: 'Failed to connect'
        )
        expect(obj.check(url)).to eq(expected)
      end
    end
  end
end
