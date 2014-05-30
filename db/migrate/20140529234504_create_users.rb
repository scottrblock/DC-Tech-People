class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :id
      t.string :bio
      t.integer :follower_count
      t.string :angellist_url
      t.string :image_url
      t.string :online_bio_url
      t.string :twitter_url
      t.string :facebook_url

      t.timestamps
    end
  end
end
