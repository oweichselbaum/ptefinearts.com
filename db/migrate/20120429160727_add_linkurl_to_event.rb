class AddLinkurlToEvent < ActiveRecord::Migration
  def change
    add_column :events, :linkurl, :string
  end
end
