require 'visit'

class LogParser
  def initialize(log)
    @log = log
  end

  def parse
    result = []

    log.each_line do |line|
      parsed_entry = line.split(' ')

      # TODO: add keyword arguments to increase readability for Visit arguments?
      result << Visit.new(parsed_entry[0], parsed_entry[1])
    end

    result
  end

  private

  attr_reader :log
end
