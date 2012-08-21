class Piece < ActiveRecord::Base
  attr_accessible :dimensions, :medium, :title, :year, :piece, :artist_id, :thumbnail, :slideshow, :slideshoworder, :edition
  belongs_to :artist
  mount_uploader :piece, PieceUploader
  mount_uploader :thumbnail, ThumbnailUploader
  acts_as_previous_next :id
end
