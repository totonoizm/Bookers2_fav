class FavoritesController < ApplicationController
  before_action :authenticate_user!


  def create
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :book_id)
  end
end
