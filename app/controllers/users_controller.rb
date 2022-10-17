class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
    @user = User.new
  end

  def index
    @user = current_user#触らない
    
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

   def create
    @post_image = User.new(user_params)
    @post_image.user_id = current_user.id
    @post_image.save
    
  end
  
   

def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
end


private

  def user_params
    params.require(:user).permit(:name, :image)
  end

end
