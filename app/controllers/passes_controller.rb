class PassesController < ApplicationController
  ## Index for default page shows all JSON objects in the database
  def index
	  render :json => Pass.all
  end
  
  ## Show page downloads the generated pass
  def show
    redirect_to :action => "download", :id => params[:id]
  end

  ## New page creates a new pass
  def new
    @pass = Pass.new
	  @pass.backgroundColor = "#333333"
	  @pass.foregroundColor = "#ffffff"
    # sets default colors
  end

  # Download page packages and signs pass
  def download
    flash.keep(:notice)
	  @pass = Pass.find(params[:id])
	
    @pkp = Passbook::PKPass.new @pass.toPassbookJson().to_json
    # converts pass to json object
  
    @pkp.addFile Rails.root.join('app/assets/images/icon.png')
	  @pkp.addFile Rails.root.join('app/assets/images/icon@2x.png')
    # adds blank icon files	

	  @small = open(@pass.logo2x.url(:small)).read
	  @original = open(@pass.logo2x.url(:original)).read
    # gets images from image server

	  @pkp.addFiles [{name: 'logo.png', content: @small}, {name: 'logo@2x.png', content: @original}]

    pkpass = @pkp.stream
	  send_data pkpass.string, type: 'application/vnd.apple.pkpass', disposition: 'attachment', filename: "pass.pkpass"
    # downloads the pass  
  end

  # Create page creates a new pass from the inputted params
  def create
	  @pass = Pass.create(params[:pass])

  	if @pass.valid? 
  	  redirect_to pass_path(:id => @pass.id)
      flash[:notice] = "You have successfully generated a pass!"    
  	else
  		flash[:error] = @pass.errors.full_messages.join(" <br/> ")
  		render :new
  	end
  end
end
