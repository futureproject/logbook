class Api::V2::HashtagsController < Api::V2::BaseController
  def index
    @hashtags = SimpleHashtag::Hashtag.order(:name).page(params[:page])
  end

  def show
    @hashtag = SimpleHashtag::Hashtag.find_by_name(params[:id])
    @records = @hashtag.try(:hashtaggables) || []
  end
end
