class UsersController < ApplicationController
    def new 
        render "users/new"
    end
    def create
        type  = params[:type]=="Customer"?3:1;
        User.create(
            name: params[:name],
            email: params[:email],
            password: params[:password],            
            user_type: type
        )
    end
end