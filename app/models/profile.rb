class Profile < ActiveRecord::Base
  attr_accessible :address, :city, :name, :state, :zip 
  belongs_to :user
  validates :user_id, presence: true
 
end
