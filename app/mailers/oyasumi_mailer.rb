class OyasumiMailer < ActionMailer::Base
  default from: "oyasumi@example.com"
  
  def oyasumi_mail(user)

    your_mail = nil
    if user != nil 
      
      attr = nil
      if user.user_attribute == nil 
        attr = UserAttribute.new
      end
      
      #get message , your message is not target
      messages = Message.all(:conditions => [  make_condition("match_attributes.sex",attr.sex) + "and" + 
                                               make_condition("match_attributes.age_range",attr.age_range) + "and" +
                                               " messages.user_id != ? " ,
                                               attr.sex,
                                               attr.age_range,
                                               user.id
                                             ],
                                             :joins => :message_attribute
                             )
      
      #make mail. message is selected by random !
      if messages.count > 0 

        message_number = rand(messages.count)
        @url = "http://oyasumimail.herokuapp.com/messages/%s/edit" % messages[message_number].id

        your_mail = mail(:to => user.email , :subject => messages[message_number].title,
                                             :body => ("Dear " + user.username + "\n\n" + messages[message_number].body + "\n\n Link -> " + @url),
                                             :from => "noreply@oyasumimail.com")
        
      end      
    end
      
      return your_mail    
  end
  
  def make_condition(column,value)
    if value != nil 
      return " ( " + column + " is NULL or "+ column + " = ? ) "
    else
      return " ( " + column + " is NULL or NULL IS ? ) "
    end
  end
  
end
