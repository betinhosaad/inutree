class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.decimal :tkcal, precision: 8, scale: 2
      t.decimal :tcarb, precision: 8, scale: 2
      t.decimal :tprot, precision: 8, scale: 2
      t.decimal :tfat, precision: 8, scale: 2
      t.timestamps
    end
  end
end
