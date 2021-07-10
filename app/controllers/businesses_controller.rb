class BusinessesController < ApplicationController
    def index
        @businesses = Business.all.order(:id)
    end

    def show
        @business = Business.find_by_id(params[:id])
    end

    def new
        @business = Business.new
    end

    def create
        @business = Business.new(params.require(:business).permit(:name, :description, user_ids:[]))

        respond_to do |format|
            if @business.save
                format.html { redirect_to businesses_path, notice: "Your business has been created" }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end
    
    def edit
        @business = Business.find_by_id(params[:id])
    end

    def update
        @business = Business.find_by_id(params[:id])

        respond_to do |format|
            if @business.update(params.require(:business).permit(:name, :description, user_ids:[]))
                format.html { redirect_to businesses_path, notice: "Your business has been updated" }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

end
