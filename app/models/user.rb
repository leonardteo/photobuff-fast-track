class User < ActiveRecord::Base
  has_many :photos, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  has_secure_password

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :username, :presence => true
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def name
    "#{first_name} #{last_name}"
  end

end
