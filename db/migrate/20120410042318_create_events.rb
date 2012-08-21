class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :gallery
      t.text :title

      t.timestamps
    end
  end
end
