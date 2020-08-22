require_relative './page'

class LogParser
  def initialize(file)
    @file = File.open(file)
    @pages = []
  end

  attr_reader :pages

  def parse
    file.each_line do |line|
      path, ip = line.split(' ')

      page = find_or_create_page(path)
      page.visit(ip)
    end
  end

  # TODO: Where should these two methods live?
  def pages_sorted_by_visits_count
    pages.sort_by(&:visits_count).reverse
  end

  def pages_sorted_by_unique_visits_count
    pages.sort_by(&:unique_visits_count).reverse
  end

  private

  attr_reader :file
  attr_writer :pages

  def find_or_create_page(path)
    find_page(path) || create_page(path)
  end

  def find_page(path)
    pages.find { |p| p.path == path }
  end

  def create_page(path)
    Page.new(path).tap { |p| pages << p }
  end
end
