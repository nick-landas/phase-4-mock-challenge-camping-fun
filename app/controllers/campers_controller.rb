class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :camper_not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid

    def index
        render json: Camper.all, status: :ok
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer:CamperActivitySerializer, status: 200
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private

    def camper_not_found
        render json: {error: "Camper not found"}, status: :not_found
    end

    def invalid(exception)
        render json: {errors: exception.record.errors.full_messages}, status: 422
    end

    def camper_params
        params.permit(:name, :age)
    end
end
