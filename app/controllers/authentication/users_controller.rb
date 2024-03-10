class Authentication::UsersController < ApplicationController

    skip_before_action :protect_route, only: [:new, :create]

    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params.merge(rol:'user',blocked:false))
        if @user.save
            redirect_to "/"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find(params[:id])
    end


    def edit
        @user = User.find(params[:id])
    end


    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to edit_user_path(params[:id]), notice:'Usuario editada correctamente.'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private 

    def user_params
        params.require(:user).permit(:email,:name,:lastname,:email,:password,:rol,:blocked,:img)
    end

end