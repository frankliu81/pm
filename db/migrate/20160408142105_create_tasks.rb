class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :project_id
      t.timestamp :due_date

      t.timestamps null: false
    end
  end
end
