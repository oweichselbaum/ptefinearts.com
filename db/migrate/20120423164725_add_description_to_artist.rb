class AddDescriptionToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :biography_id, :integer
  end
end
