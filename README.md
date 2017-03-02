# README

Todo web service. Rails with Grape.

### Setup Scripts
- `$ bundle install` RoR dependencies
- `$ bundle exec rake db:create && bundle exec rake db: migrate` sqlite3 database
- `$ bundle exec rake db:seed` grape-flavored users and tasks
- `$ rails server` run server at localhost:3000

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
`{ "name": "Buy grape-flavored soda", "users_id": 1, "due_date": date-string}`
PATCH 
`{ "id": 1, "complete": true}`

