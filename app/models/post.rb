class Post < ApplicationRecord
	attr_accessor :title

	has_many :comments
end
