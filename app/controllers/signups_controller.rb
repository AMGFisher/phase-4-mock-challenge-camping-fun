class SignupsController < ApplicationController

    def create
        new = Signup.create!(signup_params)
        render json: new.activity, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    private
    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
