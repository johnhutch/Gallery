class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, :polymorphic => true
end
