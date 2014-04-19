class DashboardController < ApplicationController
  before_filter :authorize

  def index
   	# We need to get a collection of all the users classes, assignments and exams.
   	current_user_id = session[:user_id]
   	
   	@courses = Course.where("user_id = ?", current_user_id)
   	
   	# :include allows us to load up the entire course object as we need access to the name of each course for listing out the assignment.
   	@assignments = Assignment.all(:include => :course, :conditions => { :assignments => { :is_complete => false }, :courses => { :user_id => current_user_id } }, :order => "assignments.created_at asc" )
    @completed_assignments = Assignment.all(:include => :course, :conditions => { :assignments => { :is_complete => true }, :courses => { :user_id => current_user_id } }, :order => "assignments.created_at asc" )
  end
  
end
