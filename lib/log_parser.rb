require 'page'

class LogParser
  def initialize(file)
    @file = file
    @pages = []
  end

  attr_reader :pages

  def parse
    file.each_line do |line|
      path, ip = line.split(' ')
      page = pages.find { |p| p.path == path }

      if page
        page.visits << ip
      else
        new_page = Page.new(path)
        new_page.visits << ip
        pages << new_page
      end
    end
  end

  def pages_sorted_by_visits_count
    pages.sort_by { |p| p.visits.count }.reverse
  end

  def pages_sorted_by_unique_visits_count
    pages.sort_by { |p| p.visits.uniq.count }.reverse
  end

  private

  attr_reader :file
  attr_writer :pages
end
