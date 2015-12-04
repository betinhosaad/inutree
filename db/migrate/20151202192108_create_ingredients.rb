class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :unit
      t.decimal :kcal, precision: 8, scale: 2
      t.decimal :carb, precision: 8, scale: 2
      t.decimal :prot, precision: 8, scale: 2
      t.decimal :fat, precision: 8, scale: 2
      t.timestamps
    end
  end
end
