class GooglemapsService

  def initialize
    @conn = Faraday.new(url: "hhttps://maps.googleapis.com/maps/api/") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["google_map_api_key"]
      faraday.adapter Faraday.default_adapter
    end
  end
end
