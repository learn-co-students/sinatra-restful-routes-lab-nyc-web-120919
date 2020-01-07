class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :create
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  post '/recipes' do
    Recipe.create(name: params[:name], cook_time: params[:cook_time], ingredients: params[:ingredients])

    redirect "/recipes/#{Recipe.last.id}"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    recipe = Recipe.find(params[:id]).update(name: params[:name], cook_time: params[:cook_time], ingredients: params[:ingredients])

    redirect "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id' do
    Recipe.delete(params[:id])
  end
end
