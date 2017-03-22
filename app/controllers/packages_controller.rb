class PackagesController < ApplicationController
  def index
<<<<<<< HEAD
    @package = Package.new
  end

  def create
    user_package = package_params
    total = (((((user_package[:persons].to_i * user_package[:glass_person].to_i)/2)/30 * 1200)+(user_package[:persons].to_i * 180))+(((user_package[:persons].to_i * user_package[:glass_person].to_i)/2)/30 * 1200)+(user_package[:persons].to_i * 180))
    @package = Package.new(package_params)
    @package.update(total: total)
    if logged_in? && @package.save 
      redirect_to package_tickets_path(@package)
    else
      redirect_to login_url
    end    
  end

  private

    def package_params
      params.require(:package).permit!
    end
=======
     
  end

  def create
    @user_package = params[:package]
    if logged_in?
      redirect_to controller: 'tickets', action: 'index', params: @user_package
    else
      redirect_to login_url
    end
    
  end
>>>>>>> e67bc5bf1f2bc2c7dbdfa817d49d58142e5695c5
end
