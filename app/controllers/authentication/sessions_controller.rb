class Authentication::SessionsController < ApplicationController

    skip_before_action :protect_route
    #  skip_before_action :protect_route only [:new, :create]
    
    def new
    end
    def create
        @user = User.find_by("email = :email",{email:params[:email]})

        if @user.nil?
            redirect_to new_session_path, alert: "Usuario no encontrado."
            return
          end

        if @user.blocked
            redirect_to new_session_path, alert:"Usuario bloqueado."    
            return    
        end

        if @user&.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to "/"
        else
            redirect_to new_session_path, alert:"Credenciales incorrectas." 
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to new_session_path
    end

    private

    def logged_in?  # Helper method for checking session
        session[:user_id].present?
    end

    def require_no_authentication  # Before action to enforce validation
        redirect_to "/", alert: "Ya has iniciado sesión." if logged_in?
    end

    before_action :require_no_authentication, only: [:new, :create]

end