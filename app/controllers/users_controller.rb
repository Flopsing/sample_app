class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user,   only: [:edit, :update]


  def index
    @users = User.all
  end

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
    #not needed anymore because the  before_filter :correct_user before filter
    #defines @user for us
    #@user = User.find(params[:id])

  end

  def update
    #not needed anymore because the  before_filter :correct_user before filter
    #defines @user for us
    #@user = User.find(params[:id])    
    if @user.update_attributes(params[:user])
      #handle update
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else render 'edit'
    end
  end

  private

    def signed_in_user
      #flash[:notice] = "Please sign in."
      #redirect_to signin_url1
      #before using store location we used this
      #redirect_to signin_url, notice: "Please sign in." unless signed_in?
      #now we are using 
      unless signed_in?
        store_location
        redirect_to signin_url, notice:"Please sign in"
      end

    end  

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end
