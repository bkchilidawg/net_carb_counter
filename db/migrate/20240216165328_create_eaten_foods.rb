class CreateEatenFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :eaten_foods do |t|
      t.references :user, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
