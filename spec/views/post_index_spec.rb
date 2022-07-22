require 'rails_helper'

RSpec.describe 'Post Index Page', type: :feature do
  before :each do
    @user = User.create(name: 'Have',
                        photo: 'https://cdn-icons-png.flaticon.com/512/149/149071.png', bio: 'Traveller')
    @post = Post.create(user: @user, title: 'Post 1', text: 'Micronuat')
    @comment = Comment.create(user: @user, post: @post, text: 'Traveller')
    @like1 = Like.create(user: @user, post: @post)
    @like2 = Like.create(user: @user, post: @post)
    visit user_posts_path(@user)
  end

  it 'can see the user\'s profile pic' do
    expect(page).to have_css('img')
  end

  it 'can see the user\'s name' do
    expect(page).to have_content('Have')
  end

  it 'can see the number of posys each user has made' do
    expect(page).to have_content('1')
  end

  it 'can see a post title' do
    expect(page).to have_content('Post #1')
  end

  it 'can see some of the posts body' do
    expect(page).to have_content('Traveller')
  end

  it 'can see the first comment' do
    expect(page).to have_content('Traveller')
  end

  it 'can see the number of likes each post has' do
    expect(page).to have_content('2')
  end
end
