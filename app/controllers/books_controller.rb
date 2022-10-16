class BooksController < ApplicationController
  def edit
  end

  def index
    @books=Book.all#これで投稿したのが出る
    @book=Book.new
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


  def destroy
    @book = book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def show
  end

private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  

end

