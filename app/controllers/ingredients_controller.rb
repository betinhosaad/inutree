class IngredientsController < ApplicationController
  respond_to :html, :json
  before_action :set_ingredient, only: [:edit, :update, :destroy]
  autocomplete :ingredient, :name, :extra_data => [:id, :unit, :carb, :prot, :fat]
  
  def index
    @ingredients = Ingredient.all
  end
  
  def new
    @ingredient = Ingredient.new
  end
  
  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.kcal = @ingredient.carb * 4 + @ingredient.prot * 4 + @ingredient.fat * 9
    if @ingredient.save
      
      flash[:success] = "Ingrediente criado com sucesso"
      redirect_to ingredients_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    @ingredient.update(ingredient_params)
    respond_with @ingredient
  end
  
  def destroy
    @ingredient.destroy
    if @ingredient.destroy
      flash[:success] = "Ingrediente excluído com sucesso"
      redirect_to ingredients_path
    else
      render 'new'
    end
  end
  
  private
  
    def ingredient_params
      params.require(:ingredient).permit(:id, :name, :unit, :carb, :prot, :fat)
    end
    
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end
end