class FixAssignmentCourseColumnName < ActiveRecord::Migration
  class FixColumnName < ActiveRecord::Migration
	  def change
	    rename_column :assignments, :cours_id, :course_id
	  end
	end
end
