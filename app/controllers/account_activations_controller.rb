class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    puts "*" * 50
    p user
    puts "+" * 50
    p !user.activated?
    puts "-" * 50
    
    if user && !user.activated?
      user.activate
      log_in user
      flash[:success] = "Account activated!"
      redirect_to root_url

    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
