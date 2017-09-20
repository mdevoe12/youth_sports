class RandomUserService

  def self.random_user
    @conn = Faraday.get("https://randomuser.me/api?results=2000&format=json")
    results = JSON.parse(@conn.body, symbolize_names: true)[:results]
  end
end
