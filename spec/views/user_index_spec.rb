require 'rails_helper'

Rspec.describe 'user index page', type: :feature do
  before :each do
    @user = User.create(name: 'Have', photo: 'https://example.com/photo.jpg', bio: 'Traveller')
    visit root_path
  end

  it 'can see the user name of all other users' do
    expect(page).to have_content('Have')
  end

  it 'cansee the profile picture of each user' do
    expect(page).to have_css('img')
  end

  it 'can see the number of posts each user has made' do
    Post.create(user: @user, title: 'Post 1', title: 'Traveller')
    expect(page).to have_content('1')
  end

  it 'when I click on the user, I am redirected to the user show page' do
    click_on @user.name
    expect(page).to have_content_path user_path(1)
  end
end