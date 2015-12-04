class Ingredient < ActiveRecord::Base
  has_many :meal_ingredients
  has_many :meals, through: :meal_ingredients
  
  before_save { self.name = name.capitalize }
  validates :name, presence: true, length: { minimum: 2, maximum: 25 }, uniqueness: true
  validates :unit, presence: true
  validates :carb, :prot, :fat, numericality: true, length: { minimum: 1, maximum: 5 }
  
  def ing_quantity
    meal_ingredients(:quantity)
  end
  
  def ing_quantity=(quantity)
    self.meal_ingredients = MealIngredient.find_or_create_by(quantity: quantity)
  end
    
  
end