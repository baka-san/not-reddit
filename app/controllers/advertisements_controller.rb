class AdvertisementsController < ApplicationController
  def index
  	@ads = Advertisement.all
  end

  def show
  	@ad = Advertisement.find(params[:id])
  end

  def new
  	@ad = Advertisement.new
  end

  def create
  	@ad = Advertisement.new

  	@ad.title = params[:advertisement][:title]
  	@ad.copy = params[:advertisement][:copy]
  	@ad.price = params[:advertisement][:price]

  	if @ad.save!
  		flash[:notice] = "Advertisement added."
  		redirect_to @ad
  	else
  		flash.now[:alerts] = "Advertisement wasn't created. Try again."
  		render new
  	end
  end

end
