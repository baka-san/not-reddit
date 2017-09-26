class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	belongs_to :topic
  belongs_to :user

  default_scope { order('created_at DESC') }

  # List alphabetically
  scope :ordered_by_title, -> { order('title ASC') }

  # List in reverse-chrono order
  scope :ordered_by_reverse_created_at, -> { order('created_at DESC') }


	
	validates :title, length: { minimum: 5 }, presence: true
	validates :body, length: { minimum: 20 }, presence: true
	validates :topic, presence: true
  validates :user, presence: true
end
