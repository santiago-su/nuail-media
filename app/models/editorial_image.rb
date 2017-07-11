class EditorialImage < ActiveRecord::Base
  mount_uploader :file_url, EditorialImageUploader
end
