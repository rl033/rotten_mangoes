class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  mount_uploader :avatar, AvatarUploader

  def full_name
    "#{firstname} #{lastname}"
  end
  
  # def self.set_admin(email)
  #   self.find_by(:email, email).update(:admin, )
  # end
end
