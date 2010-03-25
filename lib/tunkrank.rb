require 'httparty'

class TunkRankError < Error; end

class TunkRank
  include HTTParty

  base_uri 'http://tunkrank.com'

  class << self
    def score(twitter_user)
      get("/score/#{twitter_user}.json")
    end

    def raw_score(twitter_user)
      score(twitter_user)['raw_tunkrank_score']
    rescue
      raise TunkRankError, "Score not calculated for #{twitter_user}."
    end

    def ranking(twitter_user)
      score(twitter_user)['ranking']
    rescue
      raise TunkRankError, "Score not calculated for #{twitter_user}."
    end

    def refresh(twitter_user)
      get("/refresh/#{twitter_user}.json")
    rescue
      raise TunkRankError, "Unable to refresh #{twitter_user}."
    end
  end
end