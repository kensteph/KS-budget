class CategoriesController < ApplicationController
  
  def index
    @categorie = Category.all
  end

end