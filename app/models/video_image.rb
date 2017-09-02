class VideoImage < ActiveRecord::Base
  mount_uploader :file_url, VideoImageUploader
end
