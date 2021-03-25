require './config/environment'


use Rack::MethodOverride
use EntriesController
run ApplicationController
