class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
    @user = User.new
    @user = current_user
  end

  def index
    @user = current_user#触らない
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    #@users=User.all
  end

   def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
     redirect_to books_path
   end



def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
end


private

  def user_params
    params.require(:user).permit(:name, :image, :introduction, )
  end

end