class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :gallery
  mount_uploader :image, PhotoUploader
end
