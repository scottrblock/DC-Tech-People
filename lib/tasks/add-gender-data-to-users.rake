namespace :db do

  desc "use genderize.io to add gender data to users"
  task :add_gender_to_users  => :environment do
    
    require 'genderize_io_rb'

    User.all.each do |u|
      gir = GenderizeIoRb.new

      begin  
        res = gir.info_for_name(u.first_name) 
      rescue  
      else
        u.probability = res[:result].probability
        u.gender      = res[:result].gender
      ensure
        u.save!
      end
    end

  end
end