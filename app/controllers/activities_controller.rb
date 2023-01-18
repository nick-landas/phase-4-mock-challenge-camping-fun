class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :activity_not_found

    def index
        render json: Activity.all, status: :ok
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        render json: {}, status: :ok
    end

    private

    def activity_not_found(exception)
        render json: {error: "Activity not found"}, status: :not_found
    end
end
