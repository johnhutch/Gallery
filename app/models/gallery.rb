class Gallery < ActiveRecord::Base
  has_many :photos, :dependent => :destroy
  belongs_to :user
  has_many :comments, :as => :content
end
