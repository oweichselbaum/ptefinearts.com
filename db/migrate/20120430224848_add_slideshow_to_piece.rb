class AddSlideshowToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :slideshow, :boolean, :default => false
    add_column :pieces, :slideshoworder, :integer
  end
end
