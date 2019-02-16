class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @response = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "e5029337d54c0a7a197b"
      req.params['client_secret'] = "a51b519e0b63b275479f492a31aa2f104cc341bb"
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@response.body)
    @results = body_hash['items']
    render 'search'
  end
end
