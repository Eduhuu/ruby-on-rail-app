class Authentication::SessionsController < ApplicationController

    skip_before_action :protect_route
    #  skip_before_action :protect_route only [:new, :create]
    
    def new
    end
    def create
        @user = User.find_by("email = :email",{email:params[:email]})

        if @user&.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to "/"
        else
            redirect_to sessions_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to sessions_path
    end


end