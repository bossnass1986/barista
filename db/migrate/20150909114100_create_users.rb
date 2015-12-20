class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, length: 40
      t.string :email, length: 255
      t.string :mobile, length: 10
      t.boolean :sms_notification, :default => false, :null => false
      t.boolean :push_notification, :default => true, :null => false

      t.timestamps
    end
    # add_index :users, :email, :unique => true
    add_index :users, :mobile, :unique => true
  end
end
