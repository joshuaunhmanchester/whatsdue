class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :course_id
      t.string :class_name
      t.string :details
      t.string :teacher_name
      t.integer :user_id

      t.timestamps
    end
  end
end
