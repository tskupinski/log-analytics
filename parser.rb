require_relative 'lib/log_parser'
require_relative 'lib/printer'
require_relative 'lib/analytics'

analytics = Analytics.new(ARGV.first)
analytics.parse_file

Printer.pages_with_visits_count(analytics.pages_sorted_by_visits_count)
Printer.pages_with_unique_visits_count(analytics.pages_sorted_by_unique_visits_count)
