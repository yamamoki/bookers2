class UsersController < ApplicationController
 before_action :is_matching_login_user, only: [:edit, :update]
 before_action :ensure_guest_user, only: [:edit]

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = current_user#触らない自分自身ログイン済み
    @users = User.all
  end

  def show
    @user=User.find(params[:id])#触らないたくさんのユーザーの一人
    #@books = @user.books
    @users=User.all
    @books=@user.books
  end

   def create
    @user = User.edit(user_params)
    @user.user_id = current_user.id
    @user.save
    flash[:notice] ="You have created book successfully."
     redirect_to books_path
   end


def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] ="You have updated user successfully"
    redirect_to user_path(@user.id)
    else
    render :edit
    end
end

private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, )
  end

# ここからアクセス制限
  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to user_path(current_user)
    end
  end
  # ここまで追加

   def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
   end
end