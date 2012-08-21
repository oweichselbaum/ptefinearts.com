class Event < ActiveRecord::Base
  attr_accessible :gallery, :title, :linkurl, :event
  mount_uploader :event, EventUploader
end
