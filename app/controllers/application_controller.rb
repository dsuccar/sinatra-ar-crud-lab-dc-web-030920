
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
   

  end

  get '/' do #index
    erb :index
  end

  get '/articles/new' do #show form 
    erb :new
  end
  
  post '/articles' do #create article in database 
    title = params[:title]
    content = params[:content]
    article = Article.create(title: title, content: content)
    redirect "/articles/#{article.id}"
    #conformation that this was created
  end

  get '/articles' do 
    @articles = Article.all
    erb :index  
  end

  get '/articles/:id' do
 
    id = params[:id]
    @article = Article.find(id)

    erb :show
  end

  
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch "/articles/:id" do
    article = Article.find(params[:id])
    title = params[:title]
    content = params[:content]
    article.update(title: title, content: content)
    redirect  "/articles/#{article.id}"
  end

end
