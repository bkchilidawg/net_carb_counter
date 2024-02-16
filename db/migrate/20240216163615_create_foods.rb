class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :carbs
      t.float :fiber
      t.float :net_carbs

      t.timestamps
    end
  end
end
