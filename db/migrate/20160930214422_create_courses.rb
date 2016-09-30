class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, limit: 40
      t.string :description, limit: 40
      t.integer :status

      t.timestamps null: false
    end
  end
end
