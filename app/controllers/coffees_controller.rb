class CoffeesController < ApplicationController
    skip_before_action :verify_authenticity_token
    @@admin = false
    def list
        render :list 
    end
    def login
        if(@@admin)
            show = false
        end
        @@admin = true
        if(show)
            render :login
        end
    end
    def auth
        if(@@admin || (params["email"] == "admin@cafteria.com" && params["pwd"] == "admin"))
            render :addCoffee
        else
            render plain: "Email or Password wrong :("
        end
    end
    def addCoffee
        @admins = true
        Coffee.create(name: params["name"],img_url: params["img_url"])
        render :list
    end
    def delete
        @admins = true
        Coffee.find(params["id"]).delete
        render :list
    end
end