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

end

# git add . 
# git commit -m "add some descriptive message here about what you did"
# git push

