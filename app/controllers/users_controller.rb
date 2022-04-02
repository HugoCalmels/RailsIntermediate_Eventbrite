class UsersController < ApplicationController
  include Devise::Controllers::Helpers

  def index
    @users = User.all
    puts @users
  end

  def show
    @user = User.find(params[:id])
    @user_attendances = Attendance.where(user_id: current_user.id).sort { |a,b| a.event.start_date <=> b.event.start_date }
    @user_attendances.map do |el|
    puts el.event.start_date
    puts Time.now
    end
  end

  def edit
    @user = current_user
  end

  def update
    # This is coming from /password/edit
    if !params[:new_password].nil?
      if params[:new_password] != params[:new_password_confirmation]
        redirect_to password_edit_path, danger: "Les nouveaux mots de passe ne sont pas identiques !"
      elsif !current_user.valid_password?(params[:password])
        redirect_to password_edit_path, danger: "Mauvais ancien mot de passe !"
      elsif current_user.valid_password?(params[:new_password]) 
        redirect_to password_edit_path, danger: "Le nouveau mot de passe doit être différent de l'ancien mot de passe"
      elsif params[:new_password].length < 6
        redirect_to password_edit_path, danger: "Le mot de passe doit comporter 6 caractères au minimum !"
      else
        @user = current_user
        @user.password = params[:password]
        @user.save(validate: false)
        sign_in(@user, :bypass => true)
        redirect_to edit_user_registration_path, success: "Mot de passe changé avec success !"
      end
    end
    # This is coming from /email/edit
    if !params[:email].nil?
      if current_user.valid_password?(params[:password])
        @user = current_user
        @user.email = params[:email]
        @user.skip_reconfirmation!
        @user.save(validate: false)
        redirect_to edit_user_registration_path, success: "Email changé avec success !"
      else 
        redirect_to email_edit_path, danger: "Attention, Mauvais mot de passe !"
      end
    end

  end

end
