class FoodsController < ApplicationController
  def index
    @foods = []
    if params[:query].present?
      response = fetch_foods_from_api(params[:query])
      @foods = response['foods'] if response && response['foods'].present?
      Rails.logger.debug "Foods from API: #{@foods.inspect}"
    end
  end

  def show
    @food = fetch_food_by_id(params[:id])
    Rails.logger.debug "Food from API: #{@food.inspect}"
  end

  private

  def fetch_food_by_id(id)
    service = FoodDataCentralService.new("mOkTLDSQdNqogTRPY38ukW70o9lR0fH38Afe1wTc")
    response = service.fetch_food_by_id(id)
    food_details = response['foods'].first if response && response['foods'].present?
    construct_food_object(food_details) if food_details
  rescue StandardError => e
    Rails.logger.error "Error fetching food from API: #{e.message}"
    nil
  end

  def construct_food_object(food_details)
    food = OpenStruct.new(
      fdcId: food_details['fdcId'],
      description: food_details['description'],
      publicationDate: food_details['publicationDate'],
      foodNutrients: food_details['foodNutrients']
    )
    food
  end
  
  def fetch_foods_from_api(query)
    service = FoodDataCentralService.new("mOkTLDSQdNqogTRPY38ukW70o9lR0fH38Afe1wTc")
    service.search_food(query)
  rescue StandardError => e
    Rails.logger.error "Error fetching foods from API: #{e.message}"
    []
  end
end
