class EntriesController < ApplicationController
    
    get '/posts' do
        erb :index
    end 
end