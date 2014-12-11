class Logbook::AssetsController < Logbook::ApplicationController
  def index
    if attachable_params[:attachable_type] && attachable_params[:attachable_id]
      @attachable = eval("#{attachable_params[:attachable_type]}.find(#{attachable_params[:attachable_id]})")
      @assets = Asset.where(attachable_params)
    else
      @assets = Asset.all
    end
    @assets = @assets.order('created_at DESC').page(params[:page])
  end

  def show
    @asset = Asset.find params[:id]
    redirect_to @asset.data(:original)
  end

  def destroy
    @asset = Asset.find(params[:id])
    if @asset.destroy
      respond_to do |format|
        format.html { redirect_to request.referrer, notice: 'Asset destroyed' }
        format.js
      end
    end
  end

  private
    def attachable_params
      params.slice(:attachable_id, :attachable_type)
    end

end
