# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf

# Allow ".amr" as an extension for files with the mime type "application/octet-stream".
ios_audio = MIME::Types["application/octet-stream"].first
ios_audio.extensions << "amr"
MIME::Types.index_extensions ios_audio
