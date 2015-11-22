class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.decimal :amount, precision: 8, scale: 2, default: 0

      t.timestamps null: false
    end
  end
end
