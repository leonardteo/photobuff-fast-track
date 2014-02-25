class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy

  # Validation
  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true

  # Paperclip
  has_attached_file :photo, :styles => { :large => "1280x1280>", :thumbnail => "640x640#" }
  validates_attachment :photo, :presence => true
end
