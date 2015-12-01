class Api::V2::AssetsController < Api::V2::BaseController

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

  def signed_s3_path
    objectName = params[:s3_object_name]
    mimeType = params['s3_object_type']
    expires = Time.now.to_i + 100 # PUT request to S3 must start within 100 seconds

    amzHeaders = "x-amz-acl:public-read" # set the public read permission on the uploaded file
    stringToSign = "PUT\n#{mimeType}\n#{expires}\n#{amzHeaders}\n/#{ENV["FOG_DIRECTORY"]}/#{objectName}";
    sig = CGI::escape(Base64.strict_encode64(OpenSSL::HMAC.digest('sha1', ENV["AWS_SECRET_ACCESS_KEY"], stringToSign)))
    @response = {
      signed_request: CGI::escape("http://s3.amazonaws.com/#{ENV["FOG_DIRECTORY"]}/#{objectName}?AWSAccessKeyId=#{ENV["AWS_ACCESS_KEY_ID"]}&Expires=#{expires}&Signature=#{sig}"),
      url: "http://s3.amazonaws.com/#{ENV["FOG_DIRECTORY"]}/#{objectName}"
    }
    render json: @response
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
