class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def show_all
    @users = User.all
    respond_to do |format|
      format.pdf do
          pdf = UserShowAllPdf.new(@users, view_context)
          send_data pdf.render, filename: "user_show_all.pdf",
                                type: "application/pdf",
                                disposition: "inline"
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User created"
      redirect_to users_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    #if params[:user][:password].blank?
      #params[:user].delete(:password)
      #params[:user].delete(:password_confirmation)
    #end

    #if @user.update_with_password(params[:user])
    if @user.update_attributes(params[:user])
      # sign_in @user, :bypass => true
      flash[:notice] = "Successfully updated user."
      redirect_to users_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end
end
