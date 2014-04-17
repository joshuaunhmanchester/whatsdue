class Course < ActiveRecord::Base
	belongs_to :user
	has_many :assignments, :dependent => :destroy

	# def assignments 
	# 	Assignment.scoped(:joins => :)
	# end
end
