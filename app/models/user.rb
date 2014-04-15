class User < ActiveRecord::Base
	# Configures Rails to properly encrypt the users password. Uses the bcrypt gem.
	has_secure_password
  
    validates_uniqueness_of :email

    has_many :courses, :dependent => :destroy
end
