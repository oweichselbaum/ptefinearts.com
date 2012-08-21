class AddEditionToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :edition, :string
  end
end
