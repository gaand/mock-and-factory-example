require 'rails_helper'

RSpec.describe 'Articles API' do
  before(:context) do
    @article = FactoryGirl.create(:article)
  end
  after(:context) do
    @article = FactoryGirl.delete(:article)
  end
  describe 'GET /articles' do
    it 'lists all articles' do
      get '/articles'

      expect(response).to be_success
      expect(response.status).to eq(200)

      articles = JSON.parse(response.body)
      p response.body
      expect(articles.length).to eq(1)
      article = articles.first
      expect(article['title']).to eq('One stupid trick')
      expect(article['content']).to eq('You won\'t believe what happens next')
    end
  end

  describe 'GET /articles/:id' do
    it 'shows one article' do
      get "/articles/#{@article.id}"
    end
  end
end
