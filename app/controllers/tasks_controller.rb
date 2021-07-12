class TasksController < ApplicationController
    def new
        @task = Task.new(business_id: params[:business_id])
    end
    
    def create
        @task = Task.new(params.require(:task).permit(:title, :task_type, :due_date, :business_id, :image))
        respond_to do |format|
            if @task.save
                format.html { redirect_to business_path(params[:task][:business_id]), notice: "Your portfolio item is now live" }
            else
                format.html { render :new, status: :unprocessable_entity, notice: "Task could not be created" }
            end
        end
    end
    def show
        @task = Task.find_by_id(params[:id])
    end



end
