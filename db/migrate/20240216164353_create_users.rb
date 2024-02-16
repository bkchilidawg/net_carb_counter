class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.float :daily_net_carbs

      t.timestamps
    end
  end
end
