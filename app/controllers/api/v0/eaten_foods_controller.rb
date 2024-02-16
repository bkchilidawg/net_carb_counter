class Api:V0::EatenFoodsController < ApplicationController
  before_action :authenticate_user!

  def create
    food = Food.find(params[:food_id])
    net_carbs = food.carbs - food.fiber
    current_user.update(daily_net_carbs: current_user.daily_net_carbs + net_carbs)
    redirect_to root_path, notice: "Food added to your daily net carb count."
  end

  def destroy
    eaten_food = current_user.eaten_foods.find(params[:id])
    net_carbs = eaten_food.food.carbs - eaten_food.food.fiber
    current_user.update(daily_net_carbs: current_user.daily_net_carbs - net_carbs)
    eaten_food.destroy
    redirect_to root_path, notice: "Food removed from your daily net carb count."
  end
end
