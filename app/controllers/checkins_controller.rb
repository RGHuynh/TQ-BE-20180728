class CheckinsController < ApplicationController
  before_action :set_checkin, only: [:show, :update, :destroy]

  # # GET /checkins
  def index
    @checkin = Checkin.select("DISTINCT ON (venue_name) *").where(checkin: true)

    render json: @checkin
  end

  def get_user_list 
    checkin_service = CheckinService.new(checkin_params)
    render json: checkin_service.identify_user
  end
  
  def create
    already_checkin?
    checkin_service = CheckinService.new(checkin_params)
    if checkin_service.user_distance?
      @checkin = Checkin.new(reconsile_params)
    end
    if @checkin.save
      render json: @checkin, status: :created, location: @checkin
    end
  end

  # PATCH/PUT /checkins/1
  def update
    checkin = Checkin.find_by(user_id: reconsile_params[:user_id], checkin: 'true')
    checkin.update(checkin: 'false') if checkin
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

    def already_checkin?
      @checkin = Checkin.find_by(user_id: reconsile_params[:user_id], checkin: true)
      if @checkin
        @checkin.update_attribute(:checkin, false)
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_checkin
      @checkin = Checkin.find(params[:id])
    end

    def reconsile_params
      parameter ={}
      parameter[:venue_name] = checkin_params[:venue_name]
      parameter[:longitude] = checkin_params[:longitude]
      parameter[:latitude] = checkin_params[:latitude]
      parameter[:user_id] = checkin_params[:user_id]
      parameter[:checkin] = checkin_params[:checkin]

      parameter
    end

    # Only allow a trusted parameter "white list" through.
    def checkin_params
      params.permit(:venue_name, :longitude, :latitude, :user_id, :checkin, user: [:latitude, :longitude])
    end
end
