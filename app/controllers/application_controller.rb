require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
    set :method_overide, true
  end

  get "/" do
    erb :welcome
  end

  helpers do 

    def current_user 
      @current_user ||= User.find_by_id(session[:user_id])
    end 

    def logged_in?
      !!session[:author_id]
    end 
  
  end 

end

# git add . 
# git commit -m "add some descriptive message here about what you did"
# git push


