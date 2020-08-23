require 'log_parser'
require 'analytics'

RSpec.describe LogParser do
  subject { LogParser.new(file, analytics) }

  let!(:file) { File.open('spec/fixtures/sample_webserver.log') }
  let!(:analytics) { Analytics.new(file) }

  describe '#parse' do
    it 'creates pages for each unique path in log file' do
      expect { subject.parse }.to change(analytics.pages, :count).from(0).to(6)

      expect(analytics.pages[0].path).to eq('/help_page/1')
      expect(analytics.pages[0].visits.count).to eq(6)
    end
  end
end
