require 'rails_helper'

RSpec.describe ArticlesController do
  describe 'index action' do
    before(:example) do
      expect(Article).to receive(:all) { [] }
    end
    it 'is successful' do
      get :index
      # expect(response.status).to eq(200)
      expect(response).to be_ok
    end
    it 'renders a JSON response' do
      get :index
      articles = JSON.parse(response.body)
      # expect(articles).to exists
      expect(articles).to be_an(Array)
    end
  end
  describe 'show action' do
    before(:example) do
      expect(Article).to receive(:find) { {} }
    end
    it 'is successful' do
      get :show, id: 1
      # expect(response.status).to eq(200)
      expect(response).to be_ok
    end
    it 'renders a JSON response' do
      get :show, id: 1
      parsed_article = JSON.parse(response.body)
      expect(parsed_article).to be_a(Hash)
    end
  end
end
