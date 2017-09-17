class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true, length: {minimum: 5}
  validates :url, uniqueness: true
end
