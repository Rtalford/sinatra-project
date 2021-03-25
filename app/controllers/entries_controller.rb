class EntriesController < ApplicationController
    
    #index route
    get '/posts' do
        @entries = Entry.all
        erb :'entries/index'
    end 

    #new route

    get '/posts/new' do 
        erb : 'entries/new'
    end 

    #show route

    get '/posts/:id' do 
        @entry = Entry.find(params[:id])
        erb :'entries/show'
    end 

    post '/posts' do
       @entry = Entry.new(params)
       @entry.save
       redirect "/entries/#{@entry.id}"
    end 

    get 'posts/:id/edit' do
        
    end 

    patch '/posts/:id' do 

    end 

    delete '/post/:id' do 
    
    end 
end