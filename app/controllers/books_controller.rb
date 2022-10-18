class BooksController < ApplicationController
  def edit
     @user = current_user
  end

  def index
     @books=Book.all
     #@book=Book.new
     @user=current_user#触らない
  end

def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
end

def create
    @book = Book.edit(user_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] ="You have created book successfully."
     redirect_to book_path(user.id)
end

def update
    @book = Book.find(params[:id])
    @book.update(user_params)
    flash[:notice] ="You have updated book successfully"
    redirect_to book_path(@user.id)
end


  def show
    @book=Book.find(params[:id])#触らない

  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end