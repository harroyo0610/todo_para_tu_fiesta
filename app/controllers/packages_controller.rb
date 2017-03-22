class PackagesController < ApplicationController
  def index
    @package = Package.new
  end

  def create
    user_package = package_params
    if params[:package][:type] == "1" 
      @total = (((user_package[:persons].to_i * user_package[:glass_person].to_i)/2)/30 * 1200)+(user_package[:persons].to_i * 180)
    elsif params[:package][:type] == "2"
      @total = (((user_package[:persons].to_i * user_package[:glass_person].to_i)/2)/30 * 1200)
    elsif params[:package][:type] == "3"
      @total = (user_package[:persons].to_i * 180)
    end
    @package = Package.new(package_params)
    @package.update(total: @total)

    if logged_in? && @package.save 
      redirect_to package_tickets_path(@package)
    else
      redirect_to login_url
    end    
  end

  private

    def package_params
      params.require(:package).permit(:persons, :glass_person, :size, :meat)
    end
end
