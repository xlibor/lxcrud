
return function(route)

	route:group({prefix = '/tasks',  as = 'task'}, function()
	 	-- route:post('/clear', 'task@clear')

	end)
    route:resource('tasks', 'task')
end
 
