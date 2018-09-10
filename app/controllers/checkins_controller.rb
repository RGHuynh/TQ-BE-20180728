class CheckinsController < ApplicationController
  before_action :set_checkin, only: [:show, :update, :destroy]

  # # GET /checkins
  # def index
  #   @checkins = Checkin.all

  #   render json: @checkins
  # end

  # # GET /checkins/1
  # def show
  #   render json: @checkin
  # end

  # POST /checkins
  def create
    checkin_service = CheckinService.new(checkin_params)
    if checkin_service.user_distance?
      binding.pry
      @checkin = Checkin.new(reconsile_params)
    end
    if @checkin.save
      render json: @checkin, status: :created, location: @checkin
    else
      render json: @checkin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /checkins/1
  def update
    if @checkin.update(checkin_params)
      render json: @checkin
    else
      render json: @checkin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /checkins/1
  def destroy
    @checkin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkin
      @checkin = Checkin.find(params[:id])
    end

    def reconsile_params
      parameter ={}
      parameter[:name] = checkin_params[:name]
      parameter[:longitude] = checkin_params[:longitude]
      parameter[:latitude] = checkin_params[:latitude]
      parameter[:user_id] = checkin_params[:user_id]
      parameter[:checkin] = checkin_params[:checkin]

      parameter
    end

    # Only allow a trusted parameter "white list" through.
    def checkin_params
      params.permit(:name, :longitude, :latitude, :user_id, :checkin, user: [:latitude, :longitude])
    end
end
