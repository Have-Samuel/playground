require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'feature requests are welcome!', post: Post.first, user: User.first) }

  before { subject.save }

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'text must not exceed 255 characters' do
    subject.text = 'a' * 256
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
end
