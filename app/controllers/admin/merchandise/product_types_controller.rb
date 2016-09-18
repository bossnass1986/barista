class Admin::Merchandise::ProductTypesController < Admin::BaseController
  helper_method :sort_column, :sort_direction

  def index
    @property_sets = PropertySet.all
  end

  def show
    @property_set = PropertySet.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @property_set }
    end
  end

  def new
    @property_set = PropertySet.new
    form_info
  end

  def create
    @property_set = PropertySet.new(allowed_params)

    if @property_set.save
      redirect_to :action => :index
    else
      form_info
      flash[:error] = "The @@property_set could not be saved"
      render :action => :new
    end
  end

  def edit
    @property_set = PropertySet.find(params[:id])
    form_info
  end

  def update
    @property_set = PropertySet.find(params[:id])

    if @property_set.update_attributes(allowed_params)
      redirect_to :action => :index
    else
      form_info
      render :action => :edit
    end
  end

  def destroy
    @property_set = PropertySet.find(params[:id])
    @property_set.active = false
    @property_set.save

    redirect_to :action => :index
  end

  private

  def allowed_params
    params.require(:property_set).permit(:name, :parent_id )
  end

  def form_info
    @property_sets = PropertySet.all
  end

  def sort_column
    PropertySet.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

end