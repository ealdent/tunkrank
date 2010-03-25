# TunkRank

Interface to the [TunKRank API](http://tunkrank.com/api).  [TunKRank](http://tunkrank.com) is a tool that measures a person's influence on Twitter by looking at how much attention your followers can actually give you.  You can read more [here](http://tunrkank.com/about).

## Usage

   require 'tunkrank'
   TunkRank.score('ealdent')
   TunkRank.raw_score('ealdent')  # => 6.87
   TunkRank.ranking('ealdent')    # => 21


The result of the `score` method is a `Hash` that looks like the following

    {
      "twitter_user" => {
        "ranking" => 21,
        "raw_tunkrank_score" => 6.87,
        "tunkrank_computed_at" => "2010-03-25T00:20:13Z",
        "num_followers" => 575,
        "num_friends" => 219,
        "twitter_id" => 8454562,
        "screen_name" => "ealdent"
      }
    }

## Copyright

Copyright (c) 2010 Jason Adams. See LICENSE for details.
