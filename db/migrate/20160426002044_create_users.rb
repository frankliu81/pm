class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :password_reset_token
      t.datetime :password_reset_requested_at
      t.boolean :admin
      t.boolean :activated
      t.string :activation_requested_at

      t.timestamps null: false
    end
  end
end
