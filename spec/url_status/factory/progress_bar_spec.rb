# frozen_string_literal: true

RSpec.describe URLStatus::Factory::ProgressBar do
  describe '.produce' do
    context 'when progress bar enabled' do
      it 'returns ProgressBar instance' do
        obj = described_class.produce(10, true)
        expect(obj).to be_a(::ProgressBar)
      end

      specify 'ProgressBar initializes correctly' do
        count = 10
        expect(::ProgressBar).to receive(:new).with(count)
        described_class.produce(count, true)
      end
    end

    context 'when progress bar disabled' do
      it 'returns ProgressBar instance' do
        obj = described_class.produce(10, false)
        expect(obj).to be_a(OpenStruct)
      end
    end
  end
end
