class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
end
