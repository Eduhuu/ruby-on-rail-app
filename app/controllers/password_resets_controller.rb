class PasswordResetsController < ApplicationController

    skip_before_action :protect_route

    def new
    end

    def create
        @user = User.find_by(email:params[:email])
        if @user.present?
            PasswordMailer.with(user:@user).reset.deliver_now
        else
        end
        redirect_to "/", notice:"Si existe un usuario se envio correo de recuperacion."
    end

    def edit
    
        @user = User.find_signed!(params[:token], purpose:"password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to "/", alert:"Token invalido"
    end

    def update
        @user = User.find_signed!(params[:token], purpose:"password_reset")
        if(@user.update(password_params))
            redirect_to sessions_path, notice:"Contrasena actualizada"
        else
            render :edit
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirm)
    end
end
