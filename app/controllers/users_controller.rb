class UsersController < ApplicationController

  def edit
    @user=User.new
  end

  def index
  end

  def show
    #@user = User.find(params[:id])
    #@books = @user.books
  end

   def create
    #@user = User.new(params[:user])   #これはRails3までの実装
    @user = User.find(params[:id])
    if @user.save
      #保存の成功をここで扱う
      redirect_to '/users/:id'
    else
      render 'root'
    end
   end

end
