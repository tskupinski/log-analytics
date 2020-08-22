require_relative 'lib/log_parser'
require_relative 'lib/printer'

parser = LogParser.new(ARGV.first)
parser.parse

Printer.pages_with_visits_count(parser.pages_sorted_by_visits_count)
Printer.pages_with_unique_visits_count(parser.pages_sorted_by_unique_visits_count)
