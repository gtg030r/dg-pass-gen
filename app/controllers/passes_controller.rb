class PassesController < ApplicationController
  def index
	   render :json => Pass.all
  end

  def show
    render :json => Pass.find(params[:id]).toPassbookJson()
  end

  def new
    @pass = Pass.new
	@pass.backgroundColor = "#dddddd"
	@pass.foregroundColor = "#ffffff"
  end

  def download
	@pass = Pass.find(params[:id])
	
	@logo = logo.url(:small)
	@logo2x = logo.url(:original)
    
	@pkp = Passbook::PKPass.new @pass.toPassbookJson().to_json
	@pkp.addFile Rails.root.join('app/assets/images/icon.png')
	@pkp.addFile Rails.root.join('app/assets/images/icon@2x.png')	
	@pkp.addFile Rails.root.join(@logo)	
	@pkp.addFile Rails.root.join(@logo2x)	

	pkpass = @pkp.stream
	send_data pkpass.string, type: 'application/vnd.apple.pkpass', disposition: 'attachment', filename: "pass.pkpass"
  end

  def create
	@pass = Pass.create(params[:pass])

  	if @pass.valid? 
  	  redirect_to pass_path(:id => @pass.id)
  	else
  		flash[:error] = @pass.errors.full_messages.join(" <br/> ")
  		render :new
  	end
  end
end
