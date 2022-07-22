RSpec.describe 'Home', type: :request do
  describe 'GET /index' do
    it 'returns httpp success' do
      get '/home/index'
      expect(response).to have_http_status(:success)
    end
  end
end