class TaskSerializer < ActiveModel::Serializer
  attributes :id, :working_hours, :description, :status, :project

  def project
    return nil if object.project.nil?
    object.project.name
  end
end
