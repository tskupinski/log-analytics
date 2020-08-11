class LogParser
  def initialize(log)
    @log = log
  end

  def parse
    result = []

    log.each_line do |line|
      parsed_entry = line.split(' ')

      result << { url: parsed_entry[0], origins: parsed_entry[1] }
    end

    result
  end

  private

  attr_reader :log
end
