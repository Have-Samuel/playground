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
    expect(subject).to_not be_valid
  end

  it 'LikesCounter must be an integer greater than or equal to zero.' do
    subject.likes_counter = 'z'
    expect(subject).to_not be_valid
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  # describe 'last_5_comments' do
  #   it 'should return the last_5_comments' do
  #     expect(subject.last_5_comments.count).to be <= 5
  #   end
  # end
  describe '#most_recent_five_comments' do
    it 'should return the most recent five comments' do
      expect(subject.most_recent_five_comments.count).to be <= 5
    end
  end
end
