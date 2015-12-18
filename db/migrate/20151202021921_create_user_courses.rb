class CreateUserCourses < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|
      t.references :user, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.datetime :deadline
      t.boolean :is_completed, default: false

      t.timestamps null: false
    end
  end
end
