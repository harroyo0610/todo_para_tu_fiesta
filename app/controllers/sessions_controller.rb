class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
      #log user in and redirect to the user's show page
    if user && user.authenticate(params[:session][:password])
      if user.activated?  
        log_in user #sessions helper metodo 
        params[:session][:remember_me] == '1' ? remember(user) : forget(user) #metodo para recordar al token del usuario
        redirect_to root_url #redirige a la pagina de perfil del usuario
      else
        message = "Account not activated."
        message += "Check your email for the activation link"
        flash[:warning] = message 
        redirect_to root_url
     end 
    else
      flash.now[:danger]= "Invalid email/password combination"
      render 'new'
    end
  end
  
  #cierra la session del usuario actual
  def destroy
    log_out if logged_in?
    #log_out #manda llamar a log_out app/helpers/session_helper
    redirect_to root_url #redirije a home
  end

end
