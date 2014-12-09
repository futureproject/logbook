class Logbook::AssetsController < Logbook::ApplicationController
  def show
    @asset = Asset.find params[:id]
    redirect_to @asset.data(:original)
  end
end
