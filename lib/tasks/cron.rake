task :cron  => :environment do
    
    @users = User.all()
    i = 0
        
    @users.each do |u|
      if i > 190 
        break; #for free limit ...
      end

      OyasumiMailer.oyasumi_mail(u)
      i += 1

    end
       
end