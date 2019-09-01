
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @articles = Article.all
    erb :index
  end

  # Shows an individual article
  get '/show' do 
    erb :show
  end


  # Shows all articles
  get '/index' do 
    @articles = Article.all
    erb :index
  end
  


  get '/articles' do
    @articles = Article.all
    erb :index
  end

  post '/articles' do
    Article.create(params)
    redirect '/articles'
  end


  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @desiredArticle = Article.find(params["id"])
    erb :show
  end




end
