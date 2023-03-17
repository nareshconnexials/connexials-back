# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
   before_action :authenticate_admin_user!



   def authenticate_admin_user!
    header = request.headers["Authorization"]
    token = header.split(' ')&.last if header
    data = decode(token)
    set_current_user(data[:user_id])
    unless current_user
      render json: {message: "unauthorized request"}, status: :unauthorized
    end
  end

    # def authenticate_admin
    #   # TODO Add authentication logic here.
    # end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
