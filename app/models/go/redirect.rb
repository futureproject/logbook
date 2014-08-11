class Go::Redirect < ActiveRecord::Base
  validates_presence_of :shortcut, :url
  validates_uniqueness_of :shortcut
end
