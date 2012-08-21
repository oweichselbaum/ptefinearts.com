class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.text :firstname
      t.text :lastname 

      t.timestamps
    end
  end
end
