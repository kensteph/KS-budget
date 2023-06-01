class UserTransactionsController < ApplicationController
  include AuthenticationHelper
  before_action :authenticate_user!

  def index
    @category = Category.find(params[:category_id].to_i)
    @transactions = UserTransaction.includes(:author,:category).where(author_id:current_user,category_id: params[:category_id].to_i).order(created_at: :desc)
    @total_price = @transactions.pluck(:amount).sum
  end

  def new 
    @transaction = UserTransaction.new
    @categories = Category.where(user_id: current_user)
    @category_id = params[:category_id]
  end

  def create
    @transaction = UserTransaction.new(transaction_params)
    @transaction.author = current_user
    @transaction.category_id = params[:category].to_i
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to category_user_transactions_path(params[:category]), notice: 'Transaction was successfully created.' }
      else
        puts @transaction.errors.inspect
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def transaction_params
    params.require(:user_transaction).permit(:name, :amount, :category_id)
  end

end