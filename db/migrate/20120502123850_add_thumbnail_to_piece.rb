class AddThumbnailToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :thumbnail, :string
  end
end
