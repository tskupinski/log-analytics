require_relative './log_parser'
require_relative './printer'

class Analytics
  def initialize
    @parser = LogParser.new(self)
    @printer = Printer
    @pages = []
  end

  attr_reader :pages, :parser, :printer

  def parse_file(file_path)
    parser.parse(File.open(file_path))
  end

  def register_visit(path, ip)
    page = find_page(path) || create_page(path)
    page.register_visit(ip)
  end

  def pages_sorted_by_visits_count
    pages.sort_by(&:visits_count).reverse
  end

  def pages_sorted_by_unique_visits_count
    pages.sort_by(&:unique_visits_count).reverse
  end

  private

  attr_writer :pages

  def find_page(path)
    pages.find { |p| p.path == path }
  end

  def create_page(path)
    Page.new(path).tap { |p| pages << p }
  end
end
