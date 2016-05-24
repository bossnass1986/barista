module MerchantsHelper
  def setup_merchant(merchant)
    merchant.address ||= Address.new
      # merchant
  end
end
