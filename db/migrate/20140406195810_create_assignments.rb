class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :assignment_id
      t.string :assignment_name
      t.string :details
      t.integer :priority
      t.datetime :date_created
      t.datetime :date_due
      t.boolean :is_complete
      t.integer :grade_received
      t.integer :cours_id

      t.timestamps
    end
  end
end
