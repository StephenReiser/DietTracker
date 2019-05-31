class WelcomeController < ApplicationController
    def index
        render json: { status: 200, message: "Diet Tracker API" }
      end
end
