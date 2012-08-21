class AddBiographyToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :displayname, :string
    add_column :artists, :livesin, :string
    add_column :artists, :para1, :text
    add_column :artists, :para2, :text
    add_column :artists, :para3, :text
    add_column :artists, :para4, :text
    add_column :artists, :pata5, :text
  end
end
