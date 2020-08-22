require 'log_parser'

RSpec.describe LogParser do
  subject { LogParser.new(file) }

  let!(:file) { File.open('spec/fixtures/sample_webserver.log') }

  describe '#parse' do
    it 'creates pages for each unique path in log file' do
      expect { subject.parse }.to change(subject.pages, :count).from(0).to(6)

      expect(subject.pages[0].path).to eq('/help_page/1')
      expect(subject.pages[0].visits.count).to eq(4)
    end
  end

  describe '#pages_sorted_by_visit_count' do
    # TODO: fix the spec to set pages in before and than rely on variables comparison
    # before { subject.pages = [] }
    
    context 'when there are pages' do
      before { subject.parse }

      xit 'returns pages sorted by number of visits' do
        expect(subject.pages_sorted_by_visit_count[0].path).to eq('/help_page/1')
        expect(subject.pages_sorted_by_visit_count[1].path).to eq('/home')
      end
    end

    context 'when there are no pages' do
      it 'returns empty list' do
        expect(subject.pages_sorted_by_visit_count).to eq([])
      end
    end

  end
end
