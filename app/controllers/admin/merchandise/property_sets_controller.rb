class Admin::Merchandise::PropertySetsController < Admin::BaseController
  helper_method :sort_column, :sort_direction

  def index
    @property_sets = PropertySet.order(:name).page params[:page]
  end

  def new
    @property_set = PropertySet.new
    @property_set.properties.build
  end

  def create
    @property_set = PropertySet.new(allowed_params)

    if @property_set.save
      @property_set.update_attributes(property_ids: params[:property_set][:property_ids])
      redirect_to :action => :index
    else
      @properties = Property.all
      flash[:error] = "The prototype property could not be saved"
      render :action => :new
    end
  end

  def edit
    # @properties = Property.all
    @property_set = PropertySet.includes(:properties).find(params[:id])
    @property_set.properties.build
  end

  def update
    @property_set = PropertySet.find(params[:id])
    @property_set.property_ids = params[:property_set][:property_ids]
    if @property_set.update_attributes(allowed_params)
      redirect_to :action => :index
    else
      @properties = Property.all
      render :action => :edit
    end
  end

  def destroy
    @prototype = Category.find(params[:id])
    @prototype.active = false
    @prototype.save

    redirect_to :action => :index
  end
  private

  def allowed_params
    params.require(:property_set).permit(:name, :active, :property_ids)
  end

  def sort_column
    Category.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

end