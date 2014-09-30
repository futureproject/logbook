Paperclip::Attachment.default_options[:default_url] = '//dream-os-production.s3.amazonaws.com/static-assets/document.png'
Paperclip::Attachment.default_options[:styles] = {
  :thumb => ['280x280#', :jpg],
  :small => ['640x640>', :jpg],
  :medium => ['1024x1024>', :jpg]
}
Paperclip::Attachment.default_options[:source_file_options] = {
  :all => '-auto-orient'
}
Paperclip::Attachment.default_options[:convert_options] = {
  :thumb => '-quality 80 -strip',
  :medium => '-quality 90 -strip'
}
Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:s3_credentials] = {
  :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
  :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
  :bucket => ENV['FOG_DIRECTORY']
}
