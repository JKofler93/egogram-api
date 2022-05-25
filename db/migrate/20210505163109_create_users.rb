class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name, limit: 20, unique: true, null: false
      t.string :password_digest, null: false
      t.stirng :first_name, limit: 40, null: true
      t.stirng :last_name, limit: 40, null: true
      t.string :bio, limit: 250, null: true
      t.string :email, unique: true, limit: 40, null: true
      t.string :photo, null: true

      t.timestamps
    end
  end
end
