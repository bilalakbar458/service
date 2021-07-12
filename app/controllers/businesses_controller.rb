class BusinessesController < ApplicationController
    def index
        @businesses = Business.all.order(:id)
    end

    def show
        @business = Business.find_by_id(params[:id])
        authorize @business
    end

    def new
        @business = Business.new
        authorize @business
    end

    def create
        @business = Business.new(params.require(:business).permit(:name, :description, user_ids:[]))
        authorize @business

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


    def destroy
        #Perform lookup
        @business = Business.find(params[:id])

        #Record is destroyed
        @business.destroy
        
        #Redirect
        respond_to do |format|
            format.html { redirect_to businesses_url, notice: "Your Business has been removed." }
        end
    end

end
