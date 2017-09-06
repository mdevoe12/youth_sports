class TwitterService

  def initialize
    @_connection = Faraday.new("https://api.twitter.com")
  end

  def self.from_omniauth(auth_info)
    binding.pry
  end

end
