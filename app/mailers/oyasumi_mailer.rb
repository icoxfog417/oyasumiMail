class OyasumiMailer < ActionMailer::Base
  default from: "oyasumi@example.com"
  
  def oyasumi_mail()
    @user = "test"
    @url  = "http://example.com/login"
    mail(:to => "icoxfog417@yahoo.co.jp", :subject => "oyasumi", :body => "oyasumi body")
  end
  
end
