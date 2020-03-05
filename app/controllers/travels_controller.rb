class TravelsController < ApplicationController

    def index
        @travels = Travel.all
        render json: @travels
    end

    def show
        @travel = Travel.find(params[:id])
        render json: @travel
    end

end
