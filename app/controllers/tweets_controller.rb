require 'open-uri'

class TweetsController < ApplicationController

  def post
    Post.tweet_update
    redirect_to :root
  end

end
