require 'rails_helper'

RSpec.describe PostsController, type: :request do

  describe 'get #show' do
    let!(:post) { create(:post) }

    before do
      get post_path(post), as: :json
    end

    it 'responds with 200 OK' do
      expect(response).to have_http_status :ok
    end

    it 'returns expected attributes in valid JSON' do
      expect(response.body).to eql({ post: PostSerializer.new(post).attributes }.to_json)
    end

  end
end
