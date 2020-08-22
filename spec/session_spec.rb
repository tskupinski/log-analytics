require 'session'
require 'log_parser'

RSpec.describe Session do
  subject { Session.new(file) }

  let!(:file) { File.open('spec/fixtures/sample_webserver.log') }

  describe '#pages_sorted_by_visits_count' do
    before { subject.parse_file }

    it 'returns pages sorted by number of visits' do
      expect(subject.pages_sorted_by_visits_count[0].path).to eq('/help_page/1')
      expect(subject.pages_sorted_by_visits_count[1].path).to eq('/home')
    end
  end

  describe '#pages_sorted_by_unique_visits_count' do
    before { subject.parse_file }

    it 'returns pages sorted by number of visits' do
      expect(subject.pages_sorted_by_unique_visits_count[0].path).to eq('/home')
      expect(subject.pages_sorted_by_unique_visits_count[1].path).to eq('/help_page/1')
    end
  end
end
