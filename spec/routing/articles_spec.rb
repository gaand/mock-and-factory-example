require 'rails_helper'

RSpec.describe 'routes for articles' do
  it 'routes GET /articles to the articles#index action' do
    expect(get: '/articles').to route_to(
      controller: 'articles',
      action: 'index'
    )
    # expect(get('/articles')).to route_to('articles#index')
  end
  it 'routes GET /articles/:id to the articles#show action' do
    expect(get: '/articles/1').to route_to(
      controller: 'articles',
      action: 'show',
      id: '1'
    )
  end
end
