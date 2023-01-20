class CreateLemonadeTypes < ActiveRecord::Migration[4.2]
  def change
    create_table :lemonade_types do |t|
      t.string :label
      t.string :color
      t.decimal :price

      t.timestamps null: false
    end
  end
end
