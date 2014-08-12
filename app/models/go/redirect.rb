class Go::Redirect < ActiveRecord::Base
  validates_presence_of :shortcut, :url
  validates_uniqueness_of :shortcut
  validates_format_of :url, with: /http/, message: 'must start with "http://"'
end
