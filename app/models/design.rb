class Design < ActiveRecord::Base
  has_many :design_images
  validates :name, :description, presence: true
end
