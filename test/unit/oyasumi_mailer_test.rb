require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
    user = User.new
    user.user_attribute = UserAttribute.new
    user.email = "aaa@hoge"
    user.id = 1
    
    m = Message.new
    m.title = "hogen1"
    m.message_attribute = MessageAttribute.new
    m.user_id = 2
    m.save()
    
    m = Message.new
    m.title = "hogen2"
    m.message_attribute = MessageAttribute.new
    m.save()

    
    mail = OyasumiMailer.oyasumi_mail(user)
    
    puts "get mail is .. "
    puts mail.subject
    puts mail.body
    
  
end
