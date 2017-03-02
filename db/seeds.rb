user1 = User.create(name: 'me')
user2 = User.create(name: 'you')

Task.create([
	{name: 'buy red grapes', users_id: user2.id, due_date: '2017-03-02'}, 
	{name: 'buy purple grapes', users_id: user1.id, complete: true, due_date: '2017-02-01'}, 
	{name: 'yum grape skittles', users_id: user1.id, complete: true},
	{name: 'grape freezies for the summer', users_id: user1.id, due_date: '2017-03-07', complete: true},
	{name: 'grape juice', users_id: user2.id, complete: true},    
])