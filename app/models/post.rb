class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many_attached :images

  validates :title, presence: true, length: { minimum: 3, maximum: 20 }
  validates :body, presence: true, length: { minimum: 3, maximum: 50 }
end
