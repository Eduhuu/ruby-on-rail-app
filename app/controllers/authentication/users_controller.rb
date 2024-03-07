class Authentication::UsersController < ApplicationController

    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params.merge(rol:'user',blocked:false))
        puts @user.inspect
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