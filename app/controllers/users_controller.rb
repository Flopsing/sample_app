class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])	
	end

  def new
  	#@user = Úser.new(name:"test")
  	#@user = User.find(1)
  	@user = User.new
  end

   def create
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save.
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

end
