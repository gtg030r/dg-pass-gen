class HomeController < ApplicationController

  def index
	redirect_to new_pass_path
  end

end
