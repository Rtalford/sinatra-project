class UsersController < ApplicationController 

    get '/signup' do 
        erb :"users/signup"
    end 

    post '/signup' do 
        user = User.new(params)

        if user.username.blank? || user.email.blank? || user.name.blank? || user.password.blank? || User.find_by_email(params[:email]) || User.find_by_username(params[:username])

            redirect '/signup'
        else
            user.save
            session[:user_id] = user_id
            redirect '/entries'
        end 

    end 

    get '/login' do 
        erb :"users/login"
    end 
    
    post '/login' do 
        user = User.find_by_email(params[:email])
        if user && user.authenicate(params[:password])
            session[:user_id] = user.user_id
            redirect '/entries'
        else
            flash[:error] = "Invalid login information"
            redirect '/login'
    end 
end 