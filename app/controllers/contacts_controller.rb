class ContactsController < ApplicationController
	def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Gracias por tu mensaje. Estaremos en contacto muy pronto!'
      redirect_to root_url
  
    else
      flash[:error] = 'No se puede enviar este mensaje, favor de verificar que los datos sean correctos'
      redirect_to root_url
    end
  end
end
