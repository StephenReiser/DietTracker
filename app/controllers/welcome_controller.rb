class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
    def index
        render json: { status: 200, message: "Diet Tracker API" }
      end
end
