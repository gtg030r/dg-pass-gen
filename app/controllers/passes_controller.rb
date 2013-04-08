class PassesController < ApplicationController
  def index
	render :json => Pass.all
  end

  def show
    render :json => Pass.find(params[:id]).toPassbookJson()
  end

  def new
    @pass = Pass.new
  end

  def create
    params[:serialNumber] = params[:id]
    params[:colorFormat] = "rgb("
    params[:colorFormat2] = ", "
    params[:colorFormat3] = ")"

  	pass = Pass.create(:message => params[:message], :fR => params[:fR], :fG => params[:fG], :fB => params[:fB],
		 :serialNumber => params[:serialNumber], :description => params[:description], :logoText => params[:logoText],
		:organizationName => params[:organizationName], :colorFormat => params[:colorFormat], :colorFormat2 => params[:colorFormat2], :colorFormat3 => params[:colorFormat3],
    :bR => params[:bR], :bG => params[:bG], :bB => params[:bB], :offer => params[:offer], :value => params[:value])
  	if pass.valid? 
  	  redirect_to pass_path(:id => pass.id)
  	else
  		flash[:error] = pass.errors.full_messages.join(" & ")
  		redirect_to new_pass_path
  	end
  end
end
