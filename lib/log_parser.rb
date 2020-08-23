require_relative './page'

class LogParser
  def initialize(analytics)
    @analytics = analytics
  end

  def parse(file)
    file.each_line do |line|
      path, ip = line.split(' ')

      page = analytics.find_or_create_page(path)
      page.register_visit(ip)
    end
  end

  private

  attr_reader :file, :analytics
end
