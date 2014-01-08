class Comment < ActiveRecord::Base
  belongs_to :post, :user
  attr_accessible :body
end
