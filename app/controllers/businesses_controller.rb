class BusinessesController < ApplicationController

    def show
        @business = Business.find_by_id(params[:id])
    end
end
