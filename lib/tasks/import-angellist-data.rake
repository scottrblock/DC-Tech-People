namespace :db do

  desc "load dc angel list users"
  task :load_angel_dc_users  => :environment do
    require 'httparty'
    require 'json'

    cur_page = 1
    on_last_page = false
    location_id = 1691    #DC Location
    
    begin


      response = HTTParty.get("http://api.angel.co/1/tags/#{location_id}/users?investors=by_residence&page=#{cur_page}")
      json = JSON.parse(response.body)

      api_users = json["users"]
      api_users.each do |api_u|

       
        if api_u["locations"].length == 1 || (!api_u["locations"].nil? && api_u["locations"].first["id"] == location_id)
          u = User.new

          u.name            = api_u["name"]
          u.bio             = api_u["bio"]
          u.follower_count  = api_u["follower_count"]
          u.angellist_url   = api_u["angellist_url"]
          u.image_url       = api_u["image"]
          u.online_bio_url  = api_u["online_bio_url"]
          u.twitter_url     = api_u["twitter_url"]
          u.facebook_url    = api_u["facebook_url"]
          u.source          = "AngelList"
          u.save!
        end
      end





      if cur_page == json["last_page"]
        on_last_page = true
      end

      cur_page += 1

    end while !on_last_page

  end
end