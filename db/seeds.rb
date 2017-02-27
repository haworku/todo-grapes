user = User.create(name: 'me')
Task.create([{name: 'buy grapes', users_id: user.id}, {name: 'unassigned chores'}])
