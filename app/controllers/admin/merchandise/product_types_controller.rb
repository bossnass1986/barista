class Admin::Merchandise::ProductTypesController < Admin::BaseController
  helper_method :sort_column, :sort_direction

  def index
    @attribute_sets = AttributeSet.all
  end

  def show
    @attribute_set = AttributeSet.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @attribute_set }
    end
  end

  def new
    @attribute_set = AttributeSet.new
    form_info
  end

  def create
    @attribute_set = AttributeSet.new(allowed_params)

    if @attribute_set.save
      redirect_to :action => :index
    else
      form_info
      flash[:error] = "The @attribute_set could not be saved"
      render :action => :new
    end
  end

  def edit
    @attribute_set = AttributeSet.find(params[:id])
    form_info
  end

  def update
    @attribute_set = AttributeSet.find(params[:id])

    if @attribute_set.update_attributes(allowed_params)
      redirect_to :action => :index
    else
      form_info
      render :action => :edit
    end
  end

  def destroy
    @attribute_set = AttributeSet.find(params[:id])
    @attribute_set.active = false
    @attribute_set.save

    redirect_to :action => :index
  end

  private

  def allowed_params
    params.require(:attribute_set).permit(:name, :parent_id )
  end

  def form_info
    @attribute_sets = AttributeSet.all
  end

  def sort_column
    AttributeSet.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

end