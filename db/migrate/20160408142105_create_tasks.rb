class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :body
      t.timestamp :due_date
      t.string :status, default: 'Not Done'
      t.timestamps null: false
    end
  end
end
