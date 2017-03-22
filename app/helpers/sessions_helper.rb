module SessionsHelper

	#log in the given user
	def log_in(user)
		session[:user_id] = user.id 
	end

 	#recuerda a usuario in la sesion
	def remember(user)
		user.remember
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:remember_token] = user.remember_token
	end	

  #regresar true si el usuario es el usuario loggeado
	def current_user?(user)
		user == current_user
	end

	#almacenamos al usuario en una variable de instancia que la devuelve al invocarla
	#con este metodo poedemos reaizar cambios en el estado de inicio de sesion de usuario
	#regresa el usuario correspondiente con su cookie 
	def current_user
		if (user_id = session[:user_id])
			@current_user ||= User.find_by(id: session[:user_id])
		elsif (user_id = cookies.signed[:user_id])
			user = User.find_by(id: user_id)
			if user && user.authenticated?(:remember, cookies[:remember_token])
				log_in user
				@current_user = user
			end
		end
	end 

  #comprueba que el usuario esta loggeado
	def logged_in?
		!current_user.nil?
	end

	#metodo para borrar cookies del usuario
	def forget(user)
		user.forget
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end
	
  #para salir borra la session actual del usuario y establece @current_user como nill
	def log_out 
		forget(current_user)
		session.delete(:user_id)
		@current_user = nil
	end

	

end
