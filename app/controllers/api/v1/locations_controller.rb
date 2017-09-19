class Api::V1::LocationsController < ApplicationController

  def index
    upcoming = params[:for].split(",")
    @facilities = Facility.where(id: upcoming )
    render json: @facilities, each_serializer: FacilitiesSerializer
  end
end
