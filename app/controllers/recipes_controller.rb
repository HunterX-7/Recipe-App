class RecipesController < ApplicationController
  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  def show
    @recipe = Recipe.find(params[:id])
  end

  # Get /recipes/new
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    respond_to do |f|
      if @recipe.save
        f.html { redirect_to my_recipes_path, notice: 'Recipe was successfully created' }
      else
        f.html { render :new }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id]).destroy
    respond_to do |f|
      f.html { redirect_to my_recipes_path, notice: 'Recipe was successfully destroyed' }
    end
  end

  def my_recipes
    @recipes = current_user.recipes
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
