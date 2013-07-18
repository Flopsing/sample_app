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
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])    
    if @user.update_attributes(params[:user])
      #handle update
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else render 'edit'
    end
  end

end
