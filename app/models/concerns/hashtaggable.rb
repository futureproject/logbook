module Hashtaggable
  extend ActiveSupport::Concern
  included do
    include SimpleHashtag::Hashtaggable
    def self.hashtagged tag
      records = self.joins(:hashtags)
        .where(simple_hashtag_hashtags: { name: tag })
      records
    end
  end
end


