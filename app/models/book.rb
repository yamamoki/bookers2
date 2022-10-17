class Book < ApplicationRecord
has_one_attached :image
belongs_to :user

private
  def list_params
    params.require(:user).permit(:title, :body, :image)  
  end
end
