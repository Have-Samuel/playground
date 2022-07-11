require 'rails_helper'

RSpec.describe Comments, type: :model do
  subject { Comment.new(text: 'feature requests are welcome!', post: Post.first, user: User.first) }

  before { subject.save }

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'text must not exceed 255 characters' do
    subject.text = 256
    expect(subject).to_not be_valid
  end

  it 'user should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'post should be present' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  describe '#update_comment_counter' do
    it 'should increment the comments_counter of the post' do
      comments_counter = subject.post.comments_counter
      subject.update_comment_counter
      expect(subject.post.comments_counter).to eq(comments_counter + 1)
    end
  end
end
