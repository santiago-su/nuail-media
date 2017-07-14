class Photo < ActiveRecord::Base
  has_many :photo_images
  validates :name, :description, presence: true

  scope :featured, -> { where(featured: true) }
end
