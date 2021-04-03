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

    

    #show route

    get '/entries/:id' do 
        @entry = Entry.find(params[:id])
        erb :'entries/show'
    end 

    post '/entries' do
       @entry = Entry.new(params)
       @entry.user_id = session[:user_id]
       @entry.save
       redirect "/entries/#{@entry.id}"
    end 

    #create

    get 'entries/:id/edit' do
        @entry = Entry.find_by(id:params[:id])
        if @entry.user == current_user
            erb :"/post/edit"
        else
            flash[:error] = "YOu are not the owner of this account"
            redirect '/posts'
    end 

    patch '/entries/:id' do 
        @entry = Entry.find_by_id(params[:id])
        @entry.update(title: params[:title], content: params[:content])
        redirect "/entries/#{@entry.id}"
    end 

    delete '/entries/:id' do 
        @entry = Entry.find_by(id:params[:id])
        @entry.destroy
        redirect '/entries'
    end 
end