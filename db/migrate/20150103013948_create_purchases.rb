class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :quantity
      t.integer :lemonade_type_id

      t.timestamps null: false
    end
  end
end
