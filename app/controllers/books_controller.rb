class BooksController < ApplicationController
  def edit
  end

  def index
  end

def destroy
    @book = book.find(params[:id])
    @book.destroy
    redirect_to books_path
end

  def show
  end
end
