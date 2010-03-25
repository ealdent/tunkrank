require 'httparty'

class TunkRankError < StandardError; end

class TunkRank
  include HTTParty

  base_uri 'http://tunkrank.com'

  class << self
    def score(twitter_user)
      get("/score/#{twitter_user}.json")
    rescue
      raise TunkRankError, "Unable to fetch score for #{twitter_user}."
    end

    def raw_score(twitter_user)
      score(twitter_user)['twitter_user']['raw_tunkrank_score']
    end

    def ranking(twitter_user)
      score(twitter_user)['twitter_user']['ranking']
    end

    def refresh(twitter_user)
      get("/refresh/#{twitter_user}.json")
    rescue
      raise TunkRankError, "Unable to refresh #{twitter_user}."
    end
  end
end