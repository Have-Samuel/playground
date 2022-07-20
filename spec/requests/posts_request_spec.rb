require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    it 'check the status is successful' do
      get user_posts_path(1)
      expect(response).to have_http_status(200)
    end
  end
end
