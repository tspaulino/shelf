class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :avatar, :name, :email, :username, :password, :password_confirmation, :remember_me

  validates_presence_of :name, :username
  validates_uniqueness_of :username
  mount_uploader :avatar, AvatarUploader

end
