namespace :db do

  desc "load dctech facebook users"
  task :load_facebook_users  => :environment do
    require 'httparty'
    require 'json'

    on_last_page = false

    # Yes this is the app secret key, it's only for the app, not
    # a user. Just, don't be an a-hole. Don't feel like setting
    # up env files for such a simple app, and want it to be easy
    # for everyone to get hacking on this.
    url = URI.encode("https://graph.facebook.com/144795392232569/members?access_token=389811234492998|80b10f9306eba660ac6be76becc01241")

    begin
      response = HTTParty.get(URI.parse(url), :verify => false)
      json = JSON.parse(response.body)

      api_users = json["data"]
      
      api_users.each do |api_u|

        u = User.new
        u.name        = api_u["name"]
        u.facebook_id = api_u["id"]
        u.source      = "Facebook" 
        u.save!
      end


      if json["paging"]["next"].nil?
        on_last_page = true
      else
        url = URI.encode(json["paging"]["next"])
      end

    end while !on_last_page

  end
end