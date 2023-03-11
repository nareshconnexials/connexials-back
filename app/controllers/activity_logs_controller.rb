class ActivityLogsController < ApplicationController
  
    def index
      @activity_logs = ActivityLog.all
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(@activity_logs, each_serializer: ActivityLogSerializer),
        message: ['Activity logs fetched successfully'],
        status: 200,
        type: 'Success'
      }
    end
  
    def show
      @activity_log = ActivityLog.find_by(id: params[:id])
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(@activity_log, serializer: ActivityLogSerializer),
        message: ['Activity logs fetched successfully'],
        status: 200,
        type: 'Success'
      }
    end
  
    def new
      @activity_log = ActivityLog.new
      render json: @activity_log
    end
  
    def create
      @activity_log = ActivityLog.new(activity_log_params)
      if @activity_log.save
        render json: {
        data: ActiveModelSerializers::SerializableResource.new(@activity_log, serializer: ActivityLogSerializer),
        message: ['Activity logs created successfully'],
        status: 200,
        type: 'Success'
      }
      else
        render json: {errors: @activity_log.errors, status: 400}
      end
    end
  
    def edit
      @activity_log = ActivityLog.find_by(id: params[:id])
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(@activity_log, serializer: ActivityLogSerializer),
        message: ['Activity logs fetched successfully'],
        status: 200,
        type: 'Success'
      }
    end
  
    def update
      @activity_log = ActivityLog.find_by(id: params[:id])
  
      if @activity_log.update(activity_log_params)
        render json: {
        data: ActiveModelSerializers::SerializableResource.new(@activity_log, serializer: ActivityLogSerializer),
        message: ['Activity logs created successfully'],
        status: 200,
        type: 'Success'
      }
      else
        render json: {errors: @activity_log.errors, status: 400}
      end
    end
  
    def destroy
      @activity_log = ActivityLog.find_by(id: params[:id])
      @activity_log.destroy
      render json: {
        message: ['Activity log deleted successfully'],
        status: 204
      }
    end
  
    private
  
    def activity_log_params
      params.require(:activity_log).permit(:reciepents_email_addresses, :status_date, tasks_attributes: [:id, :working_hours, :status, :description ])
    end             
end
  