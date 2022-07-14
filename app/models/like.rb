class Like < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  belongs_to :post, foreign_key: :post_id
  after_save :update_likes_counter

  def update_likes_counter
    post.likes_counter = 0 if post.likes_counter.nil?
    post.increment!(:likes_counter)
  end
end
