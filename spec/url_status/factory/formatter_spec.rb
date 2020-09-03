# frozen_string_literal: true

RSpec.describe URLStatus::Factory::Formatter do
  describe '.produce' do
    context 'when pretty format chosen' do
      it 'returns instance of Formatters::Pretty' do
        obj = described_class.produce(:pretty, [])
        expect(obj).to be_a(URLStatus::Formatters::Pretty)
      end

      specify 'formatter initializes correctly' do
        responses = %w[a b]
        expect(URLStatus::Formatters::Pretty).to \
          receive(:new)
          .with(responses)
        described_class.produce(:pretty, responses)
      end
    end

    context 'when csv format chosen' do
      it 'returns instance of Formatters::CSV' do
        obj = described_class.produce(:csv, [])
        expect(obj).to be_a(URLStatus::Formatters::CSV)
      end

      specify 'formatter initializes correctly' do
        responses = %w[a b]
        expect(URLStatus::Formatters::CSV).to \
          receive(:new)
          .with(responses)
        described_class.produce(:csv, responses)
      end
    end
  end
end
