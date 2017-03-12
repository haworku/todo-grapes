require './config/application'

use OTR::ActiveRecord::ConnectionManagement

run Rack::Cascade.new([

	Routes::Todo::API
])