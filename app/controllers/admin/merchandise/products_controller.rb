class Admin::Merchandise::ProductsController < Admin::BaseController

  def index
    @products = Product.order(:name).page params[:page]
  end

  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  def new
    form_info
    if @categories.empty?
      flash[:notice] = 'You must create a category before you create a product.'
      redirect_to new_admin_merchandise_prototype_url
    else
      @product = Product.new
      @product.categories << @categories
      # @product.category  = Category.new
    end
  end

  def create
    @product = Product.new(allowed_params)

    if @product.save
      flash[:notice] = "#{@product.name} was created successfully. What’s next?"
      redirect_to admin_merchandise_products_path
    else
      form_info
      flash[:error] = "The product could not be created!"
      render action: :new
    end
      # rescue
      # render :text => "Please make sure you have solr started... Run this in the command line => bundle exec rake sunspot:solr:start"
  end

  def edit
    @product = Product.find(params[:id])
    form_info
  end

  def update
    @product = Product.find(params[:id])
    form_info
    if @product.update_attributes(allowed_params)
      flash[:notice] = "#{@product.name} was updated successfully. What’s next?"
      redirect_to admin_merchandise_product_url(@product)
    else
      form_info
      render action: :index
    end
  end

  def add_properties
    property_sets  = PropertySet.includes(:properties).find(params[:id])
    @properties = property_sets.properties
    all_properties = Property.all

    @properties_hash = all_properties.inject({:active => [], :inactive => []}) do |h, property|
      if  @properties.detect{|p| (p.id == property.id) }
        h[:active] << property.id
      else
        h[:inactive] << property.id
      end
      h
    end
    respond_to do |format|
      format.html
      format.json { render json: @properties_hash.to_json }
    end
  end

  def activate
    @product = Product.find(params[:id])
    @product.deleted_at = nil
    if @product.save
      redirect_to admin_merchandise_product_url(@product)
    else
      if @product.description.blank?
        flash[:alert] = "Please add a description before Activating."
      else
        flash[:alert] = @product.errors.full_messages.join('  ')
      end
      redirect_to edit_admin_merchandise_products_description_url(@product)
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.deleted_at ||= Time.zone.now
    @product.save

    redirect_to admin_merchandise_product_url(@product)
  end

  private

  def allowed_params
    params.require(:product).permit(:name, :description, :keywords, :categories,
                                    :available_at, :deleted_at,
                                    :featured)
  end

  def form_info
    @categories = Category.all
  end

end