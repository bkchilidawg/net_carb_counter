require 'net/http'
require 'uri'
require 'json'

class FoodDataCentralService
  BASE_URL = 'https://api.nal.usda.gov/fdc/v1'

  def initialize(api_key)
    @api_key = api_key
    @connection = Faraday.new(BASE_URL) do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
      faraday.adapter Faraday.default_adapter
    end
  end

  def search_food(query)
    uri = URI("https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{@api_key}&query=#{query}")
    response = Net::HTTP.get_response(uri)

    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    else
      raise "FoodData Central API request failed: #{response.code} - #{response.body}"
    end
  end

  def fetch_food_by_id(id)
    response = connection.get("food/#{id}?api_key=#{@api_key}")
    if response.success?
      JSON.parse(response.body)
    else
      Rails.logger.error "Error fetching food from API: #{response.status}"
      nil
    end
  rescue StandardError => e
    Rails.logger.error "Error fetching food from API: #{e.message}"
    nil
  end


  private

  def parse_response(response)
    "Status: #{response.status}"
    "Body: #{response.body}"
  
  if response.success?
    JSON.parse(response.body)
  else
    raise "FoodData Central API request failed: #{response.status} - #{response.body}"
  end
end
end
