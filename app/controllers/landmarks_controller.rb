class LandmarksController < ApplicationController
get '/landmarks' do
  @landmarks= Landmark.all
  erb :'landmarks/index'
end
get '/landmarks/new' do
  erb :'landmarks/new'
end
get '/landmarks/:id' do
  @landmark= Landmark.find(params[:id])
  erb :'landmarks/show'
end
get '/landmarks/:id/edit' do
  @landmark=Landmark.find(params[:id])
  erb :'landmarks/edit'
end
post '/landmarks' do
  @landmark= Landmark.create(name: params["Landmark Name"], year_completed: params["Landmark Date"])
  redirect "/landmarks/#{@landmark.id}"
end
post '/landmarks/:id' do
  @landmark= Landmark.find(params[:id])
  @landmark.name= params["landmark"]["name"]
  @landmark.year_completed= params["landmark"]["year_completed"]
  binding.pry
  redirect "/landmarks/#{@landmark.id}"
end
end
