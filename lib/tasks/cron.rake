task :cron  => :environment do
    
    @users = User.all()
    i = 0
        
    @users.each do |u|
      if i > 190 
        break; #for free limit ...
      end

      mail = OyasumiMailer.oyasumi_mail(u)
      if mail != nil || mail.to != nil 
        mail.deliver()
        i += 1
      end

    end
       
end