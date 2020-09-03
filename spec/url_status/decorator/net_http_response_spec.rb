# frozen_string_literal: true

RSpec.describe URLStatus::Decorator::NetHTTPResponse do
  describe '#url' do
    it 'returns obj#url' do
      response = double(url: 'http://google.com')
      obj = described_class.new(response)
      expect(obj.url).to eq(response.url)
    end

    specify 'obj#url is doing something' do
      response = double(url: 'http://github.com')
      obj = described_class.new(response)
      expect(obj.url).to eq(response.url)
    end
  end

  describe '#availability' do
    it 'returns YES when url is available' do
      response = double(available?: true)
      obj = described_class.new(response)
      expect(obj.availability).to eq('YES')
    end

    it 'returns NO when url is unavailable' do
      response = double(available?: false)
      obj = described_class.new(response)
      expect(obj.availability).to eq('NO')
    end
  end

  describe '#http_code_and_message' do
    it 'returns http code and http message' do
      response = double(http_code: '200', http_message: 'OK')
      obj = described_class.new(response)
      expect(obj.http_code_and_message).to eq('200 OK')
    end

    context 'when http_code is empty' do
      it 'returns http message' do
        response = double(http_code: nil, http_message: 'Some Error')
        obj = described_class.new(response)
        expect(obj.http_code_and_message).to eq('Some Error')
      end
    end
  end
end
