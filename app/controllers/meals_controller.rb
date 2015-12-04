class MealsController < ApplicationController
  before_action :set_meal, only: [:edit, :update, :show]
  autocomplete :ingredients, :name

  def index
    @meals = Meal.order(updated_at: :desc).paginate(:page => params[:page], :per_page => 4)
  end
  
  def show
  end
  
  def new
    @meal = Meal.new
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
      params.require(:meal).permit(:name, :picture, :tcarb, :tprot, :tfat, :tkcal, ingredients_attributes: [:name, :unit, :quantity, :carb, :prot, :fat])
    end
    
    def set_meal
      @meal = Meal.find(params[:id])
    end
    
end
