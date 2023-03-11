class TasksController < ApplicationController
    def update
        @task = Task.find_by(id: params[:id])
    
        if @task.update(task_params)
          render json: {
          data: ActiveModelSerializers::SerializableResource.new(@task, serializer: TaskSerializer),
          message: ['Task updated successfully'],
          status: 200,
          type: 'Success'
        }
        else
          render json: {errors: @task.errors, status: 400}
        end
      end

      def task_params
        params.require(:task).permit(:working_hours, :status, :description)
      end   

end
