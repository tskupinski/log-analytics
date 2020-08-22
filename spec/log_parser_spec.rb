require 'log_parser'

RSpec.describe LogParser do
  subject { LogParser.new(file) }

  let!(:file) { File.open('spec/fixtures/sample_webserver.log') }

  describe '#parse' do
    it 'creates pages for each unique path in log file' do
      subject.parse

      expect(subject.pages.count).to eq(6)
      expect(subject.pages[0].path).to eq('/help_page/1')
      expect(subject.pages[0].visits.count).to eq(4)
    end
  end
end
