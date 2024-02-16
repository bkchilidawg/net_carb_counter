class Food < ApplicationRecord
  has_many :eaten_foods
  has_many :users, through: :eaten_foods
end