class AddPieceToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :piece, :string
  end
end
