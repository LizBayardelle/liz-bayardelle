class InquiryMailer < ApplicationMailer
  def new_inquiry(inquiry)
    @inquiry = inquiry
    mail(to: "lizbayardelle@gmail.com", subject: "New Inquiry from #{inquiry.name}")
  end
end
