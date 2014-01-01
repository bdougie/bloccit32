class User < ActiveRecord::Base
    attr_accessible :email, :password, :password_confirmation, :remember_me, :name
	  has_many :posts
end