require_relative 'lib/analytics'

analytics = Analytics.new(ARGV.first)
analytics.parse_file

analytics.printer.pages_with_visits_count(analytics.pages_sorted_by_visits_count)
analytics.printer.pages_with_unique_visits_count(analytics.pages_sorted_by_unique_visits_count)
