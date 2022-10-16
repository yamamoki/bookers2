class BooksController < ApplicationController
  def edit
     @books =Book.new
  end

  def index
    @books = Book.all
  end

def destroy
    @book = book.find(params[:id])
    @book.destroy
    redirect_to books_path
end

  def show
  end
end
