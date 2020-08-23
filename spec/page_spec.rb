require 'page'

RSpec.describe Page do
  subject { Page.new(path) }

  let(:path) { '/home' }

  describe '#register_visit' do
    let(:ip) { '126.318.035.038' }

    it 'registers visit using ip address' do
      expect { subject.register_visit(ip) }.to change(subject.visits, :count).from(0).to(1)
      expect(subject.visits[0]).to eq('126.318.035.038')
    end
  end

  describe '#visits_count' do
    before do
      subject.register_visit('126.318.035.038')
      subject.register_visit('126.318.035.038')
      subject.register_visit('444.701.448.104')
    end

    it 'returns visits count for page' do
      expect(subject.visits_count).to eq(3)
    end
  end

  describe '#unique_visits_count' do
    before do
      subject.register_visit('126.318.035.038')
      subject.register_visit('126.318.035.038')
      subject.register_visit('126.318.035.038')
      subject.register_visit('444.701.448.104')
      subject.register_visit('444.701.448.104')
    end

    it 'returns unique visits count for page' do
      expect(subject.unique_visits_count).to eq(2)
    end
  end
end
