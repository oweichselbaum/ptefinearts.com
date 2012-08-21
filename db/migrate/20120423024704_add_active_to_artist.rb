class AddActiveToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :active, :boolean, :default => false 
  end
end
