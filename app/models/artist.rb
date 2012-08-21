class Artist < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :active, :displayname, :livesin, :para1, :para2, :para3, :para4, :pata5
  has_many :pieces, :dependent => :destroy
end
