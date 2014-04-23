class Course < ActiveRecord::Base
	belongs_to :user
	has_many :assignments, :dependent => :destroy
	has_many :exams, :dependent => :destroy

	# def assignments 
	# 	Assignment.scoped(:joins => :)
	# end
end
