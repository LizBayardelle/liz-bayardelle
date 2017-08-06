class InquiriesController < ApplicationController

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.new_inquiry(@inquiry).deliver_now
      redirect_to root_path
      flash[:notice] = "Thanks for your interest!  I'll get back to you within 24 hours."
    else
      render controller: :inquiries, action: :new
    end
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    if @inquiry.destroy
      redirect_to inquiries_path
      flash[:notice] = "That one's gone now!"
    else
      render controller: :inquiries, action: :destroy
    end
  end

  def index
    @inquiries = Inquiry.all
    @inquiry = Inquiry.find_by(params[:id])
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :project_name, :branding, :seo, :social_media, :logo_design, :graphic_design, :print_materials, :copywriting, :site_design, :development, :other)
  end
end
