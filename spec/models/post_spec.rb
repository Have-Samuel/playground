require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Title', text: 'Text', user: User.first) }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters.' do
    subject.title = 280
    expect(subject).to_not be_valid
  end

  it 'Text must not exceed 250 characters.' do
    subject.text = 270
    expect(subject).to_not be_valid
  end

  it 'user should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be an integer greater than or equal to zero.' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
    subject.comments_counter = 'z'
    expect(subject).to_ be_valid
  end

  it 'LikesCounter must be an integer greater than or equal to zero.' do
    subject.likes_counter = 'z'
    expect(subject).to_not be_valid
    subject.likes_counter = -1
    expect(subject).to_ be_valid
  end

  describe '#update_post_counter' do
    it 'should increment the post_counter of the user' do
      post_counter = subject.user.post_counter
      subject.update_post_counter
      expect(subject.user.post_counter).to eq(post_counter + 1)
    end
  end

  describe 'last_5_comments' do
    it 'should return the last_5_comments' do
      expect(subject.last_5_comments.count).to be <= 5
    end
  end
end
