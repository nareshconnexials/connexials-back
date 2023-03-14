class Admin::ClientsController < ApplicationController
     
    def index
        @clients = Client.all
        render json: {
          data: ActiveModelSerializers::SerializableResource.new(@clients, each_serializer: ClientSerializer),
          message: ['Clients fetched successfully'],
          status: 200,
          type: 'Success'
        }
      end
    
      def show
        @client = Client.find_by(id: params[:id])
        render json: {
          data: ActiveModelSerializers::SerializableResource.new(@client, serializer: ClientSerializer),
          message: ['Client fetched successfully'],
          status: 200,
          type: 'Success'
        }
      end
    
      def new
        @client = Client.new
        render json: @client
      end
    
      def create
        @client = Client.new(client_params)
        if @client.save
          render json: {
          data: ActiveModelSerializers::SerializableResource.new(@client, serializer: ClientSerializer),
          message: ['Client created successfully'],
          status: 200,
          type: 'Success'
        }
        else
          render json: {errors: @client.errors, status: 400}
        end
      end
    
      def edit
        @client = Client.find_by(id: params[:id])
        render json: {
          data: ActiveModelSerializers::SerializableResource.new(@client, serializer: ClientSerializer),
          message: ['Client fetched successfully'],
          status: 200,
          type: 'Success'
        }
      end
    
      def update
        @client = Client.find_by(id: params[:id])
    
        if @client.update(client_params)
          render json: {
          data: ActiveModelSerializers::SerializableResource.new(@client, serializer: ClientSerializer),
          message: ['Client created successfully'],
          status: 200,
          type: 'Success'
        }
        else
          render json: {errors: @client.errors, status: 400}
        end
      end
    
      def destroy
        @client = Client.find_by(id: params[:id])
        @client.destroy
        render json: {
          message: ['Client deleted successfully'],
          status: 204
        }
      end
    
      private
    
      def client_params
        params.require(:client).permit(:name, :phone, :email, :city, :state, :country, :Address, :Zip_code)
      end   
end
