class CreateReferralTypes < ActiveRecord::Migration
  def change
    create_table :referral_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
