require './config/environment'

use Rack::MethodOverride
use UserRestaurantsController
use UsersController
use RestaurantsController
use YelpController
run ApplicationController
