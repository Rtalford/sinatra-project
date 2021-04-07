require './config/environment'


use Rack::MethodOverride
use EntriesController
use UsersController
run ApplicationController

