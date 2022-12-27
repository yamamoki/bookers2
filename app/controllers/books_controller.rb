class BooksController < ApplicationController
    before_action :is_matching_login_user,only:[:edit, :update]
  def edit
     @user = current_user
    @book = Book.find(params[:id])
  end

  def index
     @books=Book.all
     @book=Book.new
     @user=current_user#触らない
  end

def destroy
    book = Book.find(params[:id])
    if book.destroy #
     flash[:notice] ="Signed out successfully."  #
    redirect_to "/books"
    end
end

def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
    flash[:notice] ="You have created book successfully."
     redirect_to book_path(@book)
   else
    @books=Book.all
    @user=current_user
    render :index
   end
end

def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] ="You have updated book successfully"
    redirect_to book_path(@book)
    else
    render :edit
    end
end


  def show
    @book=Book.find(params[:id])#触らない
    @user=@book.user
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

# ここからアクセス制限
  def is_matching_login_user
    @book = Book.find(params[:id])
    @user = @book.user
    if current_user!= @user
     redirect_to books_path
    end
  end
  # ここまで追加

end

