class OyasumiMailer < ActionMailer::Base
  #default from: "oyasumi@example.com"
  
  def oyasumi_mail(user)
    
    your_mail = nil
    if user != nil && user.user_attribute != nil
      
      #get message , your message is not target
      messages = Message.all(:conditions => [  make_condition("match_attributes.sex",user.user_attribute.sex) + "and" + 
                                               make_condition("match_attributes.age_range",user.user_attribute.age_range) + "and" +
                                               " messages.user_id != ? " ,
                                               user.user_attribute.sex,
                                               user.user_attribute.age_range,
                                               user.id
                                             ],
                                             :joins => :message_attribute
                             )
      
      #make mail. message is selected by random !
      if messages.count > 0 

        message_number = rand(messages.count)
        your_mail = mail(:to => user.email , :subject => messages[message_number].title,
                                             :body => messages[message_number].body,
                                             :from => "icoxfog417@gmail.com")
        
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
