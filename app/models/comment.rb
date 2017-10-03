class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :body, length: {minimum: 1}, presence: true
  validates :user, presence: true
end
