class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :school_name
      t.string :password
      t.integer :user_id

      t.timestamps
    end
  end
end
