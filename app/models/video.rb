class Video < ActiveRecord::Base
  validates :embed_url, :name, :description, presence: true
end
