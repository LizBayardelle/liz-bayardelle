class InquiryMailer < ApplicationMailer
  def new_inquiry(inquiry)
    @inquiry = inquiry
    mail(to: "liz@lizbayardelle.com", subject: "New Inquiry from #{inquiry.name}")
  end
end
