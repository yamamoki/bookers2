class UsersController < ApplicationController
  
  def edit
  end

  def index
  end

  def show
    #@user = User.find(params[:id])
    #@books = @user.books
  end

   def create
    #@user = User.new(params[:user])   #これはRails3までの実装
    @user = User.new(user_params)
    if @user.save
      #保存の成功をここで扱う
      redirect_to @user
    else
      render 'new'
    end
   end

end
