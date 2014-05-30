class User < ActiveRecord::Base
  attr_accessible :angellist_url, :bio, :facebook_url, :follower_count, :id, :image_url, :name, :online_bio_url, :twitter_url

  def first_name
    self.name.split(" ").first
  end

end
