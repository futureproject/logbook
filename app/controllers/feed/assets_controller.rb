class Feed::AssetsController < Feed::ApplicationController
  def index
    @assets = Asset.order("created_at DESC").page(params[:page])
  end
end
