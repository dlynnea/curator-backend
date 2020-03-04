class VergeArticlesController < ApplicationController

    def index
        @verges = VergeArticle.all
        render json: @verges
    end

    def show
        @verge = VergeArticle.find(params[:id])
        render json: @verge
    end

end
