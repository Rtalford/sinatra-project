class EntriesController < ApplicationController
    
    get '/posts' do
        @posts = Post.all
        erb :index
    end 
end