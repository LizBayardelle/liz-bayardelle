class ContactMailer < ApplicationMailer
  def new_contact(contact)
    @contact = contact
    mail(to: "lizbayardelle@gmail.com", subject: "New Inquiry on LBD.com")
  end
end
