class Lesson < ActiveRecord::Base
  mount_uploader :video, VideoUploader
  belongs_to :section
end
