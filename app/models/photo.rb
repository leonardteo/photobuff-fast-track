class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy

  has_attached_file :photo, :styles => { :large => "1280x1280>", :thumbnail => "640x640#" }
end
