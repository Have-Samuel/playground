require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Doreen', photo: 'https://www.nowviba.com/images/doreenkabareebe.jpg', bio: 'Modal') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero.' do
    subject.posts_counter = -2
    expect(subject).to_not be_valid
    subject.posts_counter = -3
    expect(subject).to_not be_valid
  end

  # describe 'last_3_posts' do
  #   it 'should return the last three posts' do
  #     expect(subject.last_3_posts.count).to be <= 5
  #   end
  # end

  describe '#most_recent_three_posts' do
    it 'should return the most recent three posts' do
      expect(subject.most_recent_three_posts.count).to be <= 3
    end
  end
end
