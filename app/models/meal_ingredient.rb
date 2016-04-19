class MealIngredient < ActiveRecord::Base
  belongs_to :meal
  belongs_to :ingredient
  
  accepts_nested_attributes_for :ingredient, :reject_if => :all_blank
  
  validate :ingredient_set
  
   private
   
    def ingredient_set 
      errors.add(:ingredient_id, "Need either a new ingredient, or to select one") unless ingredient && ingredient_id.blank?
    end

end
