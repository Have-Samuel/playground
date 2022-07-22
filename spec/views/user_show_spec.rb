require 'rails_helper'

RSpec.describe 'user show page', type: :feature do
  before :each do
    @user = User.create(name: 'Justine',
                        photo: 'https://cdn-icons-png.flaticon.com/512/149/149071.png', bio: 'Employee')
    @post = Post.create(user: @user, title: 'Have', text: 'Traveller')
    visit user_path(@user)
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
end
