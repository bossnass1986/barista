class Admin::Config::OverviewController < Admin::BaseController
  # GET /admin/config/overviews
  def index
    @countries = Country.all.order(:name)
    @active_countries = Country.active_countries.all
    @tax_rates = TaxRate.all
  end

end