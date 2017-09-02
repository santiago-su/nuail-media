class Video < ActiveRecord::Base
  has_many :video_images
  validates :embed_url, :name, :description, presence: true

  scope :featured, -> { where(featured: true) }
end
