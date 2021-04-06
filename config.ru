require './config/environment'


use Rack::MethodOverride
use EntriesController
use UsersController
use Private
run ApplicationController

