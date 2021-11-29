class UsersController < ApplicationController


  def index
    puts "MMMMMMMMMMMMMMMM"
    @users = User.all
    puts @users
    puts "MMMMMMMMMMMMMM"
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.email = params[:email]
    @user.skip_reconfirmation!
    if @user.save!
      redirect_to root_path
    else 
      puts "email is invalid"
      @user.errors.messages
      render "edit"
    end
  end



end
