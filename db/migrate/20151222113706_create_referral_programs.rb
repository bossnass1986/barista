class CreateReferralPrograms < ActiveRecord::Migration
  def change
    create_table :referral_programs do |t|
      t.boolean :active
      t.text :description
      t.string :name
      t.integer :referral_bonus_id

      t.timestamps null: false
    end
  end
end
