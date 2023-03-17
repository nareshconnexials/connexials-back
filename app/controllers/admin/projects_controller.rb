class Admin::ProjectsController < ApplicationController
  before_action :load_project, only: [:show, :update, :delete]

  def index
    projects = Project.all            
    render json: {
      data: ActiveModelSerializers::SerializableResource.new(projects, each_serializer: ProjectSerializer),
      message: ['Project list fetched successfully'],
      status: :ok,
      success: :true
    }
  end

   
  def create
    @project = Project.new(project_params)
    if @project.save
      render json: {
      data: ActiveModelSerializers::SerializableResource.new(@project, serializer: ProjectSerializer),
      message: ['Project created successfully'],
      status: :created,
      success: :true
    }
    else
      render json: {errors: @project.errors, status: 400}
    end
  end

  def show
    render json: {
      data: ActiveModelSerializers::SerializableResource.new(@project, serializer: ProjectSerializer),
      message: ['Project fetched successfully'],
      status: :ok,
      success: :true
    }
  end

  def update
    if @project.update(project_params)
      render json: {
      data: ActiveModelSerializers::SerializableResource.new(@project, serializer: ProjectSerializer),
      message: ['Project updated successfully'],
      status: :ok,
      success: :true
    }
    else
      render json: {errors: @project.errors, status: 400}
    end
  end

  def destroy
    @project.destroy
    render json: {
      message: ['Project deleted successfully'],
      status: 204
    }
  end


  private

  def load_project
    @project = Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :domain, :rate, :currency, :project_type)
  end 

end
