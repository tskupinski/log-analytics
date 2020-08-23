require_relative './page'

class LogParser
  def initialize(file, analytics)
    @file = File.open(file)
    @analytics = analytics
  end

  attr_reader :analytics

  def parse
    file.each_line do |line|
      path, ip = line.split(' ')

      page = analytics.find_or_create_page(path)
      page.visit(ip)
    end
  end

  private

  attr_reader :file
end
