class CoffeesController < ApplicationController
    skip_before_action :verify_authenticity_token
    @@admin = false
    def list
        @coffees = [
            {'name' => 'Cappuccino', 'img' => 'https://images.unsplash.com/photo-1529070931222-ac0fe9a3e245?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80'},
            {'name' => 'Esspresso', 'img' => 'https://images.unsplash.com/photo-1510591509098-f4fdc6d0ff04?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80'},
            {'name' => 'Macchiato', 'img' => 'https://images.unsplash.com/photo-1485808191679-5f86510681a2?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=934&q=80'},
            {'name' => 'Cafe Latte', 'img' => 'https://images.unsplash.com/photo-1528830639624-fc16697bb8e7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=2100&q=80'},
            {'name' => 'Iced Coffee', 'img' => 'https://images.unsplash.com/photo-1514189347135-3e90a3b561f7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80'},
            {'name' => 'Dalcona', 'img' => 'https://images.unsplash.com/photo-1576169884631-382813d0090e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=975&q=80'}
        ]
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