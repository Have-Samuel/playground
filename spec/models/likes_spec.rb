require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(user: User.first, post: Post.first) }

  before { subject.save }

  # it 'author should be present' do
  #   subject.author = nil
  #   expect(subject).to_not be_valid
  # end

  it 'post should be present' do
    subject.post = nil
    expect(subject).to_not be_valid
  end
end
