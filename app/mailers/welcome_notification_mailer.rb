class WelcomeNotificationMailer < ApplicationMailer

  
  def create_notification(object)
    @greeting = "welcome to Book review System"
    @object=object
    @object_count=object.class.count 
    mail(to: 'nitishchoudhary688@gmail.com', subject: "You have succesfully created new entry
       for #{object.class}")


    mail to: "to@example.org"
  end

  
  def update_notification
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
