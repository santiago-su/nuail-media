class DesignImage < ActiveRecord::Base
  mount_uploader :file_url, DesignImageUploader
end
