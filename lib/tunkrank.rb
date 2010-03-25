require 'httparty'

class TunkRank
  include HTTParty

  base_uri 'http://tunkrank.com'

  class << self
    def score(twitter_user)
      get("/score/#{twitter_user}.json")
    end

    def refresh(twitter_user)
      get("/refresh/#{twitter_user}.json")
    end
  end
end