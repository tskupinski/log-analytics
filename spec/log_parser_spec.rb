require 'log_parser'
require 'analytics'

RSpec.describe LogParser do
  subject { LogParser.new(analytics) }

  let!(:analytics) { Analytics.new }

  describe '#parse' do
    let!(:file) { File.open('spec/fixtures/sample_webserver.log') }

    it 'creates pages for each unique path in log file' do
      expect { subject.parse(file) }.to change(analytics.pages, :count).from(0).to(6)

      expect(analytics.pages[0].path).to eq('/help_page/1')
      expect(analytics.pages[0].visits.count).to eq(6)
    end
  end
end
