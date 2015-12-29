class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  # GET /prototypes
  def index
    @prototypes = Prototype.all
  end

  # GET /prototypes/1
  def show
  end

  # GET /prototypes/new
  def new
    @prototype = Prototype.new
  end

  # GET /prototypes/1/edit
  def edit
  end

  # POST /prototypes
  def create
    @prototype = Prototype.new(prototype_params)

    if @prototype.save
      redirect_to @prototype, notice: 'Prototype was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /prototypes/1
  def update
    if @prototype.update(prototype_params)
      redirect_to @prototype, notice: 'Prototype was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /prototypes/1
  def destroy
    @prototype.destroy
    redirect_to prototypes_url, notice: 'Prototype was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prototype
      @prototype = Prototype.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def prototype_params
      params.require(:prototype).permit(:name, :active)
    end
end
