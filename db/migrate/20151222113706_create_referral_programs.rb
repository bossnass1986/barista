class CreateReferralPrograms < ActiveRecord::Migration
  def change
    create_table :referral_programs do |t|
      t.boolean :active
      t.text :description
      t.string :name
      t.integer :referral_bonus_id

      t.timestamps null: false
    end

    add_index :referral_programs, :referral_bonus_id

  end
end
