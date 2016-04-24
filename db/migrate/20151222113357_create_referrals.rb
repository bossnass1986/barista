class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.boolean :applied, default: false
      t.datetime :clicked_at
      t.string :email, limit: 255, null: false
      t.string :name, limit: 255
      t.datetime :purchased_at
      t.integer :referral_program_id, limit: 4, null: false
      t.integer :referral_type_id, limit: 4, null: false
      t.integer :referral_user_id, limit: 4
      t.integer :referring_user_id, limit: 4, null: false
      t.datetime :registered_at
      t.datetime :sent_at

      t.timestamps null: false
    end

    add_index :referrals, :email
    add_index :referrals, :referral_program_id
    add_index :referrals, :referral_type_id
    add_index :referrals, :referral_user_id
    add_index :referrals, :referring_user_id

  end
end
