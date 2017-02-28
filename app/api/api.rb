class API < Grape::API
  prefix 'api'
  format :json
  version 'v1', using: :path
  mount Todo::Data

   rescue_from ActiveRecord::RecordNotFound do |e|
	  error_response(message: e.message, status: 404)
	end
	
   rescue_from ActiveRecord::RecordInvalid do |e|
      error_response(message: e.message, status: 422)
    end
end