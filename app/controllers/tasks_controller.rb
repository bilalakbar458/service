class TasksController < ApplicationController
    def new
        @task = Task.new(business_id: params[:business_id])
    end
    
    def create
        @task = Task.new(params.require(:task).permit(:title, :task_type, :due_date, :business_id))
        respond_to do |format|
            if @task.save
                format.html { redirect_to business_path(params[:task][:business_id]), notice: "Your portfolio item is now live" }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end




end
