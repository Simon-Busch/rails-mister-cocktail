class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show 
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    # raise
  end

  def new
    @cocktail = Cocktail.new
    @ingredient = Ingredient.new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def update
    
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
