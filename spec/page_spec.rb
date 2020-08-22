require 'page'

RSpec.describe Page do
  subject { Page.new(path) }

  let(:path) { '/home' }

  describe '#visit' do
    let(:ip) { '126.318.035.038' }

    it 'registers visit using ip address' do
      expect { subject.visit(ip) }.to change(subject.visits, :count).from(0).to(1)
    end
  end
end
