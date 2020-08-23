require 'analytics'
require 'log_parser'

RSpec.describe Analytics do
  subject { described_class.new }

  describe '#parse_file' do
    let!(:file_path) { 'spec/fixtures/sample_webserver.log' }

    it 'parses the log file' do
      expect(subject.parser).to receive(:parse)
      subject.parse_file(file_path)
    end
  end

  describe '#register_visit' do
    it 'creates page with provided path' do
      expect { subject.register_visit('/example', '111.222.333.444') }.to change(subject.pages, :count).from(0).to(1)
    end

    it 'adds ip to page visits' do
      subject.register_visit('/example', '111.222.333.444')

      expect(subject.pages[0].visits.count).to eq(1)
      expect(subject.pages[0].visits[0]).to eq('111.222.333.444')
    end

    context 'when the page of given path is already exists' do
      let(:page) { Page.new('/example') }

      before { subject.pages << page }

      it 'does not create new page' do
        expect { subject.register_visit('/example', '111.222.333.444') }.not_to change(subject, :pages)
      end

      it 'adds ip to page visits' do
        subject.register_visit('/example', '111.222.333.444')

        expect(subject.pages[0].visits.count).to eq(1)
        expect(subject.pages[0].visits[0]).to eq('111.222.333.444')
      end
    end
  end

  describe '#pages_sorted_by_visits_count' do
    let!(:file_path) { 'spec/fixtures/sample_webserver.log' }

    before { subject.parse_file(file_path) }

    it 'returns pages sorted by number of visits' do
      expect(subject.pages_sorted_by_visits_count[0].path).to eq('/help_page/1')
      expect(subject.pages_sorted_by_visits_count[1].path).to eq('/home')
    end
  end

  describe '#pages_sorted_by_unique_visits_count' do
    let!(:file_path) { 'spec/fixtures/sample_webserver.log' }

    before { subject.parse_file(file_path) }

    it 'returns pages sorted by number of visits' do
      expect(subject.pages_sorted_by_unique_visits_count[0].path).to eq('/home')
      expect(subject.pages_sorted_by_unique_visits_count[1].path).to eq('/help_page/1')
    end
  end
end
