class ContactMailer < ApplicationMailer
  def new_contact(contact)
    @contact = contact
    mail(to: "liz@lizbayardelle.com", subject: "New Inquiry on LBD.com")
  end
end
