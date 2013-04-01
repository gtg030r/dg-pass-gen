class PassController < ApplicationController
  def index
	render :json => Pass.all
  end

  def show
  	render :json => Pass.find(params[:id])
  end

  def new

  end

  def create
  	formatVersion = 1
  	serialNumber = 1
  	teamIdentifier = "teamIdentifier"
  	organizationName = "DealGenda"
  	passTypeIdentifier = "dealgenda.com." + organizationName + "coupon"

  	pass = Pass.create(formatVersion => 1, :description => params[:description], :logo => params[:logo])
  	if form.valid? 
  	  redirect_to form_path(:id => pass.id)
  	else
  		flash[:error] = pass.errors.full_messages.join(" & ")
  		redirect_to new_pass_path
  	end
  end
end