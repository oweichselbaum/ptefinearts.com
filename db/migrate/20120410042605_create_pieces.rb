class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :title
      t.integer :year
      t.string :medium
      t.string :dimensions

      t.timestamps
    end
  end
end
