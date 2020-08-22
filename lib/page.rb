class Page
  def initialize(path)
    @path = path
    @visits = []
  end

  attr_reader :path, :visits

  def visit(ip)
    # TODO: Have a struct to store IP?
    visits << ip
  end

  def visits_count
    visits.count
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
