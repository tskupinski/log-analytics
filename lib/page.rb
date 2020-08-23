class Page
  def initialize(path)
    @path = path
    @visits = []
  end

  attr_reader :path, :visits

  def visit(ip)
    visits << ip
  end

  def visits_count
    visits.count
  end

  def unique_visits_count
    unique_visits.count
  end

  private

  def unique_visits
    visits.uniq
  end
end
