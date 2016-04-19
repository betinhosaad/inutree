class MealsController < ApplicationController
  before_action :set_meal, only: [:edit, :update, :show]


  def index
    @meals = Meal.all
  end
  
  def show
  end
  
  def new
    @meal = Meal.new
    @ingredient = @meal.ingredients.build
  end
  
  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      flash[:success] = "Refeição criada com sucesso!"
      redirect_to meals_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @meal.update(meal_params)
      flash[:success] = "Your meal was updated succesfully!"
      redirect_to meal_path(@meal)
    else
      render :edit
    end
  end
  
  private
  
    def meal_params
      params.require(:meal).permit(:name, :picture, meal_ingredients_attributes: [:ingredient_id, :quantity, ingredient_attributes: [ :name, :unit, :carb, :prot, :fat, :_destroy]])
    end

    
    def set_meal
      @meal = Meal.find(params[:id])
    end
    
end
