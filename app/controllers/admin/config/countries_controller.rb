class Admin::Config::CountriesController < Admin::Config::BaseController
  helper_method :sort_column, :shipping_zones
  def index
    @countries = Country.all
    @active_countries = Country.active_countries.all
  end
  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
    if @country.update_attributes(allowed_params)
      redirect_to admin_config_overview_url, :notice  => "Successfully activated country."
    else
      render :edit
    end
  end

  def activate
    @country = Country.find(params[:id])
    @country.active = true
    if @country.save
      redirect_to admin_config_overview_index_url, :notice  => "Successfully activated country."
    else
      render :edit
    end
  end

  def deactivate
    @country = Country.find(params[:id])
    @country.active = false
    if @country.save
      redirect_to admin_config_overview_index_url, :notice  => "Successfully deactivated country."
    else
      render :edit
    end
  end

  def destroy
    @country = Country.find(params[:id])
    @country.active = false
    @country.save
    redirect_to admin_config_overview_url, :notice => "Successfully inactivated country."
  end

  private

  def allowed_params
    params.require(:country).permit(:shipping_zone_id)
  end

end