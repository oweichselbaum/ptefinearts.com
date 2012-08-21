class AddImageToEvent < ActiveRecord::Migration
  def change
    add_column :events, :event, :string
  end
end
