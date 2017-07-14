class Editorial < ActiveRecord::Base
  has_many :editorial_images
  validates :name, :description, presence: true

  scope :featured, -> { where(featured: true) }
end
