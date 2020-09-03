# frozen_string_literal: true

RSpec.describe URLStatus::Factory::OutputDestination do
  describe '.produce' do
    context 'when output to STDOUT is chosen' do
      it 'returns STDOUT' do
        obj = described_class.produce('STDOUT')
        expect(obj).to eq(STDOUT)
      end
    end

    context 'write to file is chosen' do
      it 'returs correct instance' do
        file = double
        allow(::File).to receive(:open).and_return(file)
        expect(described_class.produce('path')).to eq(file)
      end

      specify 'file is opened correctly' do
        path = 'path/to/file'
        expect(::File).to receive(:open).with(path, 'w')
        described_class.produce(path)
      end
    end
  end
end
