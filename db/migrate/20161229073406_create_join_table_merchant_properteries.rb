class CreateJoinTableMerchantProperteries < ActiveRecord::Migration
  def change
    create_join_table :merchant, :properteries do |t|
      t.index [:merchant_id, :propertery_id]
      t.index [:propertery_id, :merchant_id]
    end
  end
end
