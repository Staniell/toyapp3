class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
end
