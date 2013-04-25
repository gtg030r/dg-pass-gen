class PassesController < ApplicationController
  def index
	   render :json => Pass.all
  end

  def show
    # render :json => Pass.find(params[:id]).toPassbookJson()
    redirect_to :action => "download", :id => params[:id]
  end

  def new
    @pass = Pass.new
	  @pass.backgroundColor = "#333333"
	  @pass.foregroundColor = "#ffffff"
  end

  def download
	@pass = Pass.find(params[:id])
	
	@pkp = Passbook::PKPass.new @pass.toPassbookJson().to_json
	@pkp.addFile Rails.root.join('app/assets/images/icon.png')
	@pkp.addFile Rails.root.join('app/assets/images/icon@2x.png')	

	@small = open(@pass.logo2x.url(:small)).read
	@original = open(@pass.logo2x.url(:original)).read

	@pkp.addFiles [{name: 'logo.png', content: @small}, {name: 'logo@2x.png', content: @original}]

	pkpass = @pkp.stream
	send_data pkpass.string, type: 'application/vnd.apple.pkpass', disposition: 'attachment', filename: "pass.pkpass"
  end

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
