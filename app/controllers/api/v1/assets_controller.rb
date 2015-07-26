class Api::V1::AssetsController < Api::V1::BaseController

  def create
    @asset = Asset.new(asset_params)
    @asset.caption = params[:filename] if (params[:filename] && @asset.caption.blank?)
    if @asset.save
      render json: @asset
    else
      head :unprocessable_entity
    end
  end

  def destroy
    @asset = Asset.find params[:id]
    @asset.destroy
    head :no_content
  end


  private
    def asset_params
      params.require(:asset).permit(
        :attachable_type,
        :attachable_id,
        :external_url
      )
    end
end
