class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :exam_id
      t.string :exam_name
      t.string :details
      t.string :comments
      t.datetime :date_created
      t.datetime :date_of_exam
      t.boolean :is_complete
      t.integer :grade_received
      t.integer :course_id

      t.timestamps
    end
  end
end
