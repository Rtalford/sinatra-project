class UsersController < ApplicationController 

    get '/signup' do 
        erb :"users/signup"
    end 

    post '/signup' do 

    end 

    get '/login' do 
        erb :"users/login"
    end 
    
    post '/login' do 
        user = User.find_by_email(params[:email])
    end 
end 