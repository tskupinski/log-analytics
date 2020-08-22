class Page
  def initialize(path)
    @path = path
    @visits = []
  end

  attr_reader :path, :visits
end
