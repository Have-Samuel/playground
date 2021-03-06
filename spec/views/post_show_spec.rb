require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  before :each do
    @user = User.create(name: 'Have',
                        photo: 'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png', bio: 'coder')
    @post = Post.create(user: @user, title: 'ProgrammerDYN', text: 'Never give up')
    @comment1 = Comment.create(user: @user, post: @post, text: 'Comment 1')
    @comment2 = Comment.create(user: @user, post: @post, text: 'Comment 2')
    Like.create(user: @user, post: @post)
    visit user_post_path(@user, @post)
  end

  it 'displays the author\'s username' do
    expect(page).to have_content(@user.name)
  end

  it 'displays how many comments the post has' do
    expect(page).to have_content(@post.comments_counter)
  end

  it 'displays how many likes the post has' do
    expect(page).to have_content(@post.likes_counter)
  end

  # it 'displays the post\'s body' do
  #   expect(page).to have_content('Keep working')
  # end
end
