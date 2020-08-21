class Visit
  def initialize(url:, ip:)
    @url = url
    @ip = ip
  end

  attr_reader :url, :ip
end
