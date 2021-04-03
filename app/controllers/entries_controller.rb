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
        get_entry
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
        get_entry
        redirect_if_not_user
        erb :"/entries/edit"
       
    end 

    patch '/entries/:id' do 
        get_entry
        redirect_if_not_user
        @entry.update(title: params[:title], content: params[:content])
        redirect "/entries/#{@entry.id}" 
    end 

    delete '/entries/:id' do 
        get_entry
        @entry.destroy
        redirect '/entries'
    end 

    Private 
        def get_entry 
            @entry = Entry.find_by(id:params[:id])
        end

        def redirect_if_not_user
            if @entry.user != current_user
                flash[:error] = "You are not allowed to make edits on this page"
                redirect '/entries'
            end
        end 
    end 
end