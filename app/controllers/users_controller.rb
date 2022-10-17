class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
    @user = User.new
    @user = current_user
  end

  def index
    @user = current_user#触らない
    
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

   def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    
   end
  
   

def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
end


private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

end
