class Comment < ApplicationRecord
  belongs_to :post #relationship defined as comment belongs to a post
end
