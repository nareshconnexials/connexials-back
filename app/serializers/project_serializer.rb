class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :domain, :client_name, :rate, :currency, :project_type

  def client_name
    # object.client.name  
    Faker::Name.first_name
  end
end
