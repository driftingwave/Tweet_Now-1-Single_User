class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
    tweets = Twitter.user_timeline(self.username)[0..9]
    tweets.each do |tweet|
      Tweet.where(:twitter_id => tweet.id).first_or_create(
        :text => tweet.text,
        :authored_date => tweet.created_at,
        :twitter_user_id => self.id)
    end
    self.tweets.first.update_attributes(updated_at: Time.now)
  end

  def tweets_stale?
    latest_update = self.tweets.first.updated_at
    diff = Time.now - latest_update
    true if diff/60 > 15
  end

  def cached_tweets
    self.tweets.limit(10)
  end

end
