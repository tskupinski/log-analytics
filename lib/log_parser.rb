require_relative './page'

class LogParser
  def initialize(analytics)
    @analytics = analytics
  end

  def parse(file)
    file.each_line do |line|
      path, ip = line.split(' ')
      analytics.register_visit(path, ip)
    end
  end

  private

  attr_reader :file, :analytics
end
