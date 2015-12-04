class CreateMealIngredients < ActiveRecord::Migration
  def change
    create_table :meal_ingredients do |t|
      t.integer :ingredient_id
      t.integer :meal_id
    end
  end
end
