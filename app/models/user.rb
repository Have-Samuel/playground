class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_3_posts
    posts.order(created_at: :desc).limit(3)
  end
end
