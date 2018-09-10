class Post < ApplicationRecord
	has_many :comments #relationship
	validates :title, presence: true,
						length: {minimum: 5}
end
