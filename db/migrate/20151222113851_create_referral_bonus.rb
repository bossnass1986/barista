class CreateReferralBonus < ActiveRecord::Migration
  def change
    create_table :referral_bonus do |t|
      t.integer :amount
      t.string :name

      t.timestamps null: false
    end
  end
end
