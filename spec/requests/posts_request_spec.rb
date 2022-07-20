require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  user = User.create(name: 'Have', photo: 'https://cdn-icons-png.flaticon.com/512/149/149071.png', bio: 'Micro')
  Post.create(user:, title: 'String', text: 'text')
  describe 'GET /users/:user_id/posts' do
    it 'check the status is successful' do
      get user_posts_path(46)
      expect(response).to have_http_status(200)
    end

    # it 'check the body has a placeholder' do
    #   get user_posts_path(46)
    #   expect(response.body).to include('Here is a list of posts for a given user')
    # end

    it 'render the correct template' do
      get user_posts_path(46)
      expect(response).to render_template('posts/index')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'check the status is successful' do
      get user_post_path(1, 1)
      expect(response).to have_http_status(200)
    end

    it 'render the correct template' do
      get user_post_path(1, 1)
      expect(response).to render_template('posts/show')
    end
  end
end
