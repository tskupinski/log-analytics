require_relative './page'

class LogParser
  def initialize(file, session)
    @file = File.open(file)
    @session = session
  end

  attr_reader :session

  def parse
    file.each_line do |line|
      path, ip = line.split(' ')

      page = session.find_or_create_page(path)
      page.visit(ip)
    end
  end

  private

  attr_reader :file
end
