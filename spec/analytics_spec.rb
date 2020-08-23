require 'analytics'
require 'log_parser'

RSpec.describe Analytics do
  subject { described_class.new }


  describe '#parse' do
    let!(:file_path) { 'spec/fixtures/sample_webserver.log' }

    it 'parses the log file' do
      expect(subject.parser).to receive(:parse)
      subject.parse_file(file_path)
    end
  end

  describe '#find_or_create_page' do
    it 'creates page with provided path' do
      expect do
        subject.find_or_create_page('/example')
      end.to change(subject.pages, :count).from(0).to(1)
    end

    it 'returns the page' do
      expect(subject.find_or_create_page('/example').path).to eq('/example')
      expect(subject.find_or_create_page('/example')).to be_kind_of(Page)
    end

    context 'when the page of given path is already exists' do
      let(:page) { Page.new('/example') }

      before { subject.pages << page }

      it 'does not create new page' do
        expect { subject.find_or_create_page('/example') }.not_to change(subject, :pages)
      end

      it 'returns this page' do
        expect(subject.find_or_create_page('/example')).to eq(page)
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
