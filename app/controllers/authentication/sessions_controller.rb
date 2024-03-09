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

        # @user=User.new(user_params)
        # puts @user.inspect
        # if @user.save
        #     redirect_to "/"
        # else
        #     render :new, status: :unprocessable_entity
        # end
    end
    # private 
    # def user_params
    #     params.require(:user).permit(:email,:password)
    # end

end