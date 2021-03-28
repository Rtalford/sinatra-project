class EntriesController < ApplicationController
    
    #index route 

    get '/entries' do 
        @entries = Entry.all
        erb :'entries/index'
    end 

    #new route

    get '/entries/new' do 
        erb :'entries/new'
    end 

    #create?

    #show route

    get '/entries/:id' do 
        @entry = Entry.find(params[:id])
        erb :'entries/show'
    end 

    post '/entries' do
       @entry = Entry.new(params)
       @entry.save
       redirect "/entries/#{@entry.id}"
    end 

    get 'entries/:id/edit' do
        @entry = Entry.find_by(id:params[:id])
        erb :"/post/edit"
    end 

    patch '/entries/:id' do 
        @entry = Entry.find_by(id:params[:id])
        @entry.update(title: params[:title], content: params[:content])
        redirect "/entries/#{@entry.id}"
    end 

    delete '/entries/:id' do 
        @entry = Entry.find_by(id:params[:id])
        @entry.destroy
        redirect '/entries'
    end 
end