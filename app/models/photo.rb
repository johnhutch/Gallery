class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :gallery
  has_many :comments, :as => :parent
  mount_uploader :image, PhotoUploader
end
