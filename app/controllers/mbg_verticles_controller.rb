class MbgVerticlesController < ApplicationController

    def index
        @mbgs = MbgVerticle.all
        render json: @mbgs
    end

    def show
        @mbg = MbgVerticle.find(params[:id])
        render json: @mbg
    end

end
