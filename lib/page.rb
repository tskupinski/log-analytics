class Page
  def initialize(path)
    @path = path
    @visits = []
  end

  attr_reader :path, :visits

  def visit(ip)
    visits << ip
  end

  def unique_visits_count
    unique_visits.count
  end

  private

  attr_writer :visits

  def unique_visits
    visits.uniq
  end
end
