class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :email, :city, :state, :country, :Address, :Zip_code

  def client_name
    # object.client.name  
    Faker::Name.first_name
  end
end
