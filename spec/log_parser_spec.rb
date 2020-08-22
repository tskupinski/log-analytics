require 'log_parser'
require 'session'

RSpec.describe LogParser do
  subject { LogParser.new(file, session) }

  let!(:file) { File.open('spec/fixtures/sample_webserver.log') }
  let!(:session) { Session.new(file) }

  describe '#parse' do
    it 'creates pages for each unique path in log file' do
      expect { subject.parse }.to change(session.pages, :count).from(0).to(6)

      expect(session.pages[0].path).to eq('/help_page/1')
      expect(session.pages[0].visits.count).to eq(6)
    end
  end
end
