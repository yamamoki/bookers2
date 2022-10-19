class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :profile_image

validates :name, presence: true
validates :name,
    length: { minimum: 2, maximum: 20 }
validates :introduction,
    length: { maximum: 50 }



 devise :database_authenticatable, :registerable,
 :recoverable, :rememberable, :validatable


  has_many :books, dependent: :destroy



   def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'profile_image/jpeg')
    end

    profile_image.variant(resize_to_limit: [100, 100]).processed
   end

end
