class Feed::AssetsController < Feed::ApplicationController
  def index
    @assets = Asset.where.order("created_at DESC").page(params[:page])
  end
end
