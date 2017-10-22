class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable

  validates :title, presence: true, length: {minimum: 5}
  validates :url, uniqueness: true


  def total_votes
    self.votes.where(vote: true).size - self.votes.where(vote: false).size
  end
end
