class VenuesController < ApplicationController
  before_filter :authenticate_user!, :set_venue, only: [:show, :edit, :update, :destroy]


  respond_to :html

  def index
    # if current_person
    #   @venues = Venue.near([current_person.latitude, current_person.longitude], 25, :units => :km)
    #   respond_with(@venues)
    # else
      @venues = Venue.all
    # @venues = Venue.includes(:Products).where(Products: { id: params[:menu_items_id] })
      respond_with(@venues)
    # end
  end

  def show
    respond_with(@venue)
  end

  def new
    @venue = Venue.new
    respond_with(@venue)
  end

  def edit
  end

  def create
    @venue = Venue.new(params[:venue])
    @venue.save
    respond_with(@venue)
  end

  def update
    @venue.update_attributes(params[:venue])
    respond_with(@venue)
  end

  def destroy
    @venue.destroy
    respond_with(@venue)
  end

  private
    def set_venue
      @venue = Venue.find(params[:id])
    end
end
