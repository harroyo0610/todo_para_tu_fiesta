class UserMailer < ApplicationMailer
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Activación De Cuenta"
  end

  def password_reset(user)
   	@user = user
  	mail to: user.email, subject: "Reinicio De Contraseña"
  end

  def reserv_package(user)
   	@user = user
  	mail to: user.email, subject: "Pedido"
  end


end
