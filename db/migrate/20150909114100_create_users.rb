class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, length: 40
      t.string :last_name,  length: 40
      t.string :email, length: 255
      t.string :state
      t.string :mobile, length: 10
      t.integer :account_id
      t.string :customer_cim_id ## This is the ID returned from AUTH.NET
      # t.string :password_salt
      # t.string :crypted_password
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      # t.string :perishable_token
      # t.string :persistence_token
      t.string :access_token
      t.integer :comments_count, :default => 0

      t.boolean :sms_notification, :default => true, :null => false
      t.boolean :push_notification, :default => true, :null => false

      t.timestamps
    end
    add_index :users, :first_name
    add_index :users, :last_name
    add_index :users, :email, :unique => true
    add_index :users, :mobile, :unique => true
    # add_index :users, :perishable_token,    :unique => true
    # add_index :users, :persistence_token,   :unique => true
    add_index :users, :access_token,        :unique => true

  end
end
