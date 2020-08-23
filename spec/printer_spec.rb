require 'printer'
require 'page'

RSpec.describe Printer do
  subject { described_class }

  let(:page) { Page.new('/home') }
  let(:another_page) { Page.new('/contact') }

  before do
    page.register_visit('111.222.333.444')
    another_page.register_visit('111.222.333.444')
  end

  let(:pages) { [page, another_page] }

  describe '.pages_with_visits_count' do
    it 'prints out pages with visit count' do
      expect { subject.pages_with_visits_count(pages) }
        .to output(a_string_including("/home 1 visits\n/contact 1 visits"))
        .to_stdout_from_any_process
    end
  end

  describe '.pages_with_unique_visits_count' do
    it 'prints out pages with unique visit count' do
      expect { subject.pages_with_unique_visits_count(pages) }
        .to output(a_string_including("/home 1 unique views\n/contact 1 unique views"))
        .to_stdout_from_any_process
    end
  end
end
