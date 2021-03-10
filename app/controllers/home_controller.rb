class HomeController < ApplicationController
    skip_before_action :ensure_user_loged_in
    def index
        render "home/index"
    end
end