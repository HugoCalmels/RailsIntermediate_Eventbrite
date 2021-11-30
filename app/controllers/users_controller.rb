class UsersController < ApplicationController
  include Devise::Controllers::Helpers

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
    if !params[:email].nil?
    @user = current_user
    @user.email = params[:email]
    @user.skip_reconfirmation!
    if @user.save!
      redirect_to edit_user_registration_path
    else 
      puts "email is invalid"
      @user.errors.messages
      render "edit"
    end
  else 
    @user = current_user
    @user.password = params[:password]
    if @user.save!
      sign_in(@user, :bypass => true)
      redirect_to edit_user_registration_path
    else 
      puts "email is invalid"
      @user.errors.messages
      render "edit"
    end
  end
  end



end
