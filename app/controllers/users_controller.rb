class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user["username"] = params["user"]["username"]
    @user["email"] = params["user"]["email"]
    @user["password"] = BCrypt::Password.create(params["user"]["password"])
        
    if User.exists?("email" => @user["email"])
      flash["notice"] = "User ID already exists"
    else
      flash["notice"] = "Welcome to Tacostagram"
      @user.save      
    end
   
    redirect_to "/sessions/new"
  end
end
