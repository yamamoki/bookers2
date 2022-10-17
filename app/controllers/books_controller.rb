class BooksController < ApplicationController
  def edit
     @user = current_user
  end

  def index
     @user = current_user
  end

def destroy
    @book = book.find(params[:id])
    @book.destroy
    redirect_to books_path
end

  def show
  end
end
