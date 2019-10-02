class NightsController < ApplicationController
  before_action :set_night, only: [:show, :update, :destroy]

  # GET /nights
  def index
    @nights = Night.all

    render json: @nights
  end

  # GET /nights/1
  def show
    render json: @night
  end

  # POST /nights
  def create
    @night = Night.new(night_params)

    if @night.save
      render json: @night, status: :created, location: @night
    else
      render json: @night.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /nights/1
  def update
    if @night.update(night_params)
      render json: @night
    else
      render json: @night.errors, status: :unprocessable_entity
    end
  end

  # DELETE /nights/1
  def destroy
    @night.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_night
      @night = Night.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def night_params
      params.require(:night).permit(:quality, :different)
    end
end
