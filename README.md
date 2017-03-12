# README

Todo web service. Rack & Grape.

### Setup Scripts
- `$ bundle install` RoR dependencies
- `$ bundle exec rake db:create && bundle exec rake db: migrate` sqlite3 database
- `$ bundle exec rake db:seed` grape-flavored users and tasks
- `$ rackup` run local server at port :9292

### Reference:
- https://github.com/ruby-grape/grape-on-rack
- See Jordan Hollinger's otr-activerecord' for railsy implementation of active record w/ grape and rack.  https://github.com/jhollinger/otr-activerecord


### API 
- Retrieve all tasks
`GET http://localhost:3000/api/v1/tasks`

- Retrieve tasks for specific user
`GET http://localhost:3000/api/v1/tasks/users/:user_id`

- Retrieve incomplete tasks for specific user
`GET http://localhost:3000/api/v1/tasks/users/:user_id/incomplete`

- Create a new task for specific user
`POST http://localhost:3000/api/v1/tasks`

- Mark existing task as complete
`PUT http://localhost:3000/api/v1/tasks/:task_id`

**Sample Data:**
POST 
`{ "name": "Buy grape-flavored soda", "users_id": 1, "due_date": "2019-03-09"}`

PUT
`{"complete": true}`

