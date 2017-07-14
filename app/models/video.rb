class Video < ActiveRecord::Base
  validates :embed_url, :name, :description, presence: true

  scope :featured, -> { where(featured: true) }
end
