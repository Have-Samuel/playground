require 'rails_helper'

RSpec.describe Likes, type: :model do
  subject { Likes.new(user: User.first, post: Post.first) }

  before { subject.save }

  it 'author should be present' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'post should be present' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  describe '#update_likes_counter' do
    it 'should increment the likes_counter of the post' do
      likes_counter = subject.post.likes_counter
      subject.update_likes_counter
      expect(subject.post.likes_counter).t0 eq(likes_counter + 1)
    end
  end
end
