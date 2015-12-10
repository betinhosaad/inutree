class Meal < ActiveRecord::Base
  
  has_many :meal_ingredients
  has_many :ingredients, through: :meal_ingredients
  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :meal_ingredients
  
  def carbs_total
    ingredients.carb * quantity
  end
  

  
  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
