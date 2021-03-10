class SessionsController < ApplicationController
    skip_before_action :ensure_user_loged_in
    def new
    end
    def create
        user = User.find_by(email: params[:email]);
        if user && user.authenticate(params[:password])
            session[:current_user_id] = user.id
            redirect_to  "/myCoffees"
        else
            render plain: "Incorrect"
        end
    end
end