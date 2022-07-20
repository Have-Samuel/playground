require 'rails_helper'

Rspec.describe 'user show page', type: :feature do
  before :each do
    @user = User.create(name: 'Justine', photo: 'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png', bio: 'Employee')
    @post = Post.create(user: @user, title: 'Have', text: 'Traveller')
    visit user_path(@user)
  end

  it 'can see the user\'s profile pic' do
    expext(page).to have_css('img[src="https://example.com/photo.jpg"]')
  end

  it 'can see user\'s name' do
    expect(page).to have_content('Justine')
  end

  it 'can see the number of posts each user has made' do
    expect(page).to have_content('1')
  end

  it 'can see the user\'s bio' do
    expect(page).to have_content('Traveller')
  end

  it 'can see the user\'s most recent three posts' do
    expect(page).to have_content('Post 1')
  end

  it 'cansee a button that lets me vies all of the user\'s posts' do
    expect(page).to have_link('Show all user posts')
  end

  it 'when I click a user\'s post, I am redirected to the pos show page ' do
    click_on 'Post 1'
    expect(page)to. have_current_path user_path(@user, @post)
  end

  it 'when I click to see all posts, I am redirected to the user\'s post index page' do
    click_on 'Show all user post'
    expect(page).to have_current_path user_path(@user)
  end  
end