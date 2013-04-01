class PassesController < ApplicationController
  def index
	render :json => Pass.all
  end

  def show
  	render :json => Pass.find(params[:id])
  end

  def new

  end

  def create
  	pass = Pass.create(:serialNumber.gsub!(:serialNumber), :description => params[:description], :logoText => params[:logoText])
  	if pass.valid? 
  	  redirect_to pass_path(:id => pass.id)
  	else
  		flash[:error] = pass.errors.full_messages.join(" & ")
  		redirect_to new_pas_path
  	end
  end
end