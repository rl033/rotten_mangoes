class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  mount_uploader :avatar, AvatarUploader

  def full_name
    "#{firstname} #{lastname}"
  end
  
end
