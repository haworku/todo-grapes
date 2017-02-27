class API < Grape::API
  prefix 'api'
  format :json
  version 'v1', using: :path
  mount Todo::Data
end