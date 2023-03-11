class Admin::ProjectsController < ApplicationController
  before_action :load_project, only: [:show]
  def index
    projects = Project.all            
    render json: {
      data: ActiveModelSerializers::SerializableResource.new(projects, each_serializer: ProjectSerializer),
      message: ['Project list fetched successfully'],
      status: 200,
      type: 'Success'
    }
  end

  def show
    render json: {
      data: ActiveModelSerializers::SerializableResource.new(@project, serializer: ProjectSerializer),
      message: ['project fetched successfully'],
      status: 200,
      type: 'Success'
    }
  end

  private

  def load_project
    @project = Project.find_by(id: params[:id])
  end
end
