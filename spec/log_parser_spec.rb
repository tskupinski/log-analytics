require 'log_parser'

RSpec.describe LogParser do
  subject { LogParser.new(file) }

  let!(:file) { File.open('spec/fixtures/webserver.log') }

  describe '#parse' do
    it 'returns list of parsed log entries' do
      result = subject.parse

      expect(result[0].url).to eq('/help_page/1')
      expect(result[0].ip).to eq('126.318.035.038')
      expect(result.count).to eq(500)
    end
  end
end
