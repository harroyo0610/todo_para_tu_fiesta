class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  
  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted"
    redirect_to users_url
  end

  def show 
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Por favor revisa tu email para activar tu cuenta. Revisar tu bandeja de no deseados."
      redirect_to root_url 
    else
      render 'new' #se queda en new 
    end
  end

  def edit
    #@user = User.find(params[:id])
  end  

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Cambios de tu perfil han sido guardados"
      redirect_to root_url
    else
      render 'edit'  
    end
  end

  private 

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

  #before filters
  #confirmamos que el usuario se encuentra logeado
  def logged_in_user
    unless logged_in?
      #store_location 
      flash[:danger] = "Please log in"
      redirect_to login_url
    end    
  end 

  #confirmar el usuario correcto
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  #confirmar ser un administrador
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
