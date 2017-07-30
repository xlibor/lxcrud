
local lx, _M = oo{
	_cls_ 	= '',
	_ext_ 	= 'controller'
}

local app, lf, tb, str, new = lx.kit()

function _M:ctor()

end

function _M:index(c)

 	local tasks = Task.all()

 	c:view('task', {tasks = tasks})
end

function _M:show(c, id)

    local task = Task.find(id)

    c:json(task)
end

function _M:store(c)

	local req = c.req
    self:checkTask(req)

	local name, content = req:get('name'), req:get('content')

 	local task = Task.create{name = name, content = content}
 	c:json(task)
end

function _M:update(c, id)

	local req = c.req
    self:checkTask(req)

	local name, content = req:pairs('name','', 'content','')

 	local task = Task.find(id)
 	task.name, task.content = name, content
 	task:save()

 	c:json(task)
end

function _M:destroy(c, id)

	local req = c.req
 
 	local task = Task.find(id)
 	task:delete()

 	c:json{success = true}
end

function _M.__:checkTask(req)

    self:validate(req, {
        name        = 'required|min:3|max:20',
        content     = 'required|min:3|max:100'
    })
end

return _M

