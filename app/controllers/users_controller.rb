class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @contacts = Contact.where(archived: false)
    @archived_contacts = Contact.where(archived: true)
    @clients = User.where(admin: false)
    @comments = Comment.where(approved: false)
  end

  def confirm_client
      @client = User.find(params[:id])
      if @client.update_attributes(status_confirmed: true)
          redirect_to :back
          flash[:notice] = "That message has been confirmed!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def unconfirm_client
      @client = User.find(params[:id])
      if @client.update_attributes(status_confirmed: false)
          redirect_to :back
          flash[:notice] = "That message has been unconfirmed!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def archive_client
      @client = User.find(params[:id])
      if @client.update_attributes(archived: true)
          redirect_to :back
          flash[:notice] = "That message has been archived!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def unarchive_client
      @client = User.find(params[:id])
      if @client.update_attributes(archived: false)
          redirect_to :back
          flash[:notice] = "That message has been unarchived!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def subscribe_to_blog
    @user = current_user
    if @user.update_attributes(blog_emails: true)
        redirect_to :back
        flash[:notice] = "You'll be the first to know about any new information!"
    else
        redirect_to root_path
        flash[:warning] = "Oops! Something went wrong!"
    end
  end
end
