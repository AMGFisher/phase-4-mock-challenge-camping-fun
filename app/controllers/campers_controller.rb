class CampersController < ApplicationController

    def index
        render json: Camper.all, status: 200
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, status: 200, serializer: ShowCamperSerializer
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Camper not found" }, status: 404
    end

    def create
        new = Camper.create!(camper_params)
        render json: new, status: 201
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    private
    
    def camper_params
        params.permit(:name, :age)
    end
end
