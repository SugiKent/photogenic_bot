class Post < ApplicationRecord

  scope :published, -> { where(published: true)   }
  scope :not_tweeted, -> { where(tweeted: false)   }

  def self.tweet_update
    Post.init_twitter
    post = Post.order("RAND()").published.not_tweeted.last
    if post.blank?
      Post.all.update(tweeted: false)
      post = Post.order("RAND()").published.not_tweeted.last
    end
    status = "#{post.name}\n#{post.content}"

    open(post.image_url) do |tmp|
      @client.update_with_media(status, tmp)
    end
    post.update(tweeted: true)
  end

  def self.init_twitter
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end
end
