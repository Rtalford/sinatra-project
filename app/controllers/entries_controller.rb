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
        @entry = Entry.find_by(id:params[:id])
        erb :'entries/show'
        #erb :'entries/edit'
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
        if @entry.user != current_user
           erb :"/entries/edit"
        else 
           flash[:error] = "You are not allowed to make edits on this page"
           redirect '/entries'  
        end
    end


    patch '/entries/:id' do 
        @entry = Entry.find_by(id:params[:id])
        if @entry.user != current_user
           @entry.update(title: params[:title], content: params[:content])
          redirect "/entries/#{@entry.id}" 
        else 
            flash[:error] = "You are not allowed to make edits on this page"
            redirect '/entries'  
        end
    end 

    delete '/entries/:id' do 
        @entry = Entry.find_by(id:params[:id])
        @entry.destroy
        redirect '/entries'
        
    end 

end