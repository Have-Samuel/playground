require 'rails_helper'

Rspec.describe 'Post show page', type: :feature do
  before :each do
    @user =User.create(name: 'Have', photo: 'https://example.com/photo.jpg', bio: 'coder')
    @post =Post.create(user: @user, title: 'ProgrammerDYN', text: 'Never give up')
    @comment = Comment.create(user: @user, post: @post, text: 'Comment 1')
    @comment = Comment.create(user: @user, post: @post, text: 'Comment 2')
    like.create(user: @user, post: @post)
    visit user_post_path(@user, @post)
  end

  it 'displays the post\'s title' do
    expect(page).to have_content('Keep working')
  end

  it 'displays the author\'s username' do
    expect(page).to have_content(@user.name)
  end

  it 'displays how many comments the post has' do
    expect(page).to have_content(@post.comment_counter)
  end

  it 'displays how many likes the post has' do
    expect(page).to have_content(@post.likes_counter)
  end

  it 'displays the post\'s body' do
    expect(page).to have_content('Keep working')
  end

  it 'display the name of each commentor' do
    expect(page).to have_content(@comment1.user.name)
  end

  it 'displays comments from all commentors' do
    expect(page).to have_content('comment 1')
    expect(page).to have_content('comment 2')
  end
end