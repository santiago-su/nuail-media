class PhotoImage < ActiveRecord::Base
  mount_uploader :file_url, PhotoImageUploader
end
