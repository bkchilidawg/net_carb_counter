class Api::V0::FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = Food.all
    render json: @foods
  end

  def show
    @food = Food.find(params[:id])
    @food.net_carbs = @food.carbs - @food.fiber
    render json: @food
  end
end