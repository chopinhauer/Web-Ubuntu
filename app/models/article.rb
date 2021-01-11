class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :comments
  has_many :likes, dependent: :destroy
  has_one_attached :image
  validates :tittle, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }
end
