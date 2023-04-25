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
        if @recipe.save 
            redirect_to @recipe, notice: 'Recipe was successfully created'
        else 
            render :new
        end
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        authorize @recipe
        @recipe.destroy
        redirect_to recipes_url, notice: 'Recipe was successfully destroyed'
    end

    def my_recipes
        @recipes = current_user.recipes
    end

    def recipe_params
        params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
    end
end