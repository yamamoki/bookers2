class BooksController < ApplicationController
  def edit
     @user = current_user
  end

  def index
     @books=Book.all
     @book=Book.new
  end

def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
end

def create#保存機能
    @book=Book.new(book_params)
    if @book.save
    #投稿が成功
    flash[:notice] ="Book was successfully created."
    redirect_to book_path(@book)
    else
    @books=Book.all
    render :index
    end
end
  
  def show
    @book=Book.find(params[:id])
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
