class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show 
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.find(params[:id])
    @ingredient = Ingredient.find(params[:id])
    raise
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredient, :doses)
  end

end
