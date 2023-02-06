class ActivitiesController < ApplicationController

    def index
        render json: Activity.all, status: 200
    end

    def destroy
        act = Activity.find(params[:id])
        act.destroy
        head :no_content
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Activity not found" }, status: 404
    end
end
