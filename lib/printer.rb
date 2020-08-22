class Printer
  class << self
    def pages_with_visits_count(pages)
      puts 'VISITS:'
      pages.each do |page|
        puts "#{page.path} #{page.visits_count} visits"
      end
    end

    def pages_with_unique_visits_count(pages)
      puts 'UNIQUE VISITS:'
      pages.each do |page|
        puts "#{page.path} #{page.unique_visits_count} unique views"
      end
    end
  end
end
