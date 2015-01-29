class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :email
      t.string :encrypted_password
      t.integer :sign_in_count, default: 0
      t.datetime :last_sign_in_at

      t.timestamps null: false
    end
  end
end
