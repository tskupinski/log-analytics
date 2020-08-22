class Page
  def initialize(path)
    @path = path
    @visits = []
  end

  attr_reader :path, :visits

  def visit(ip)
    visits << ip
  end

  private

  attr_writer :visits
end
