class CategoriesController < ApplicationController
  include AuthenticationHelper
  before_action :authenticate_user!

  def index
    @categories = Category.where(user_id: current_user)
    @totals = []
    @categories.each do |category|
      @totals << total(category.id)
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def total(cat)
    UserTransaction.where(author_id: current_user, category: cat).sum(:amount)
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
