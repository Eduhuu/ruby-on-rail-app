class Authentication::UsersController < ApplicationController

    skip_before_action :protect_route

    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params.merge(rol:'user',blocked:false))
        if @user.save
            # redirect_to "/", notice:t('.created')
            redirect_to "/"
        else
            render :new, status: :unprocessable_entity
        end

    end

    private 

    def user_params
    
        params.require(:user).permit(:email,:name,:lastname,:email,:password,:rol,:blocked)
    
    end

end