require 'log_parser'
require 'analytics'

RSpec.describe LogParser do
  subject { described_class.new(analytics) }

  let!(:analytics) { Analytics.new }

  describe '#parse' do
    let!(:file) { File.open('spec/fixtures/sample_webserver.log') }

    it 'registers visit in analytics for every row of log file' do
      expect(analytics).to receive(:register_visit).exactly(14).times
      subject.parse(file)
    end
  end
end
