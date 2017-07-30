
local lx, _M = oo{
    _cls_ = '',
    _ext_ = 'shift'
}

local app, lf, tb, str = lx.kit()

function _M:up(schema)

    schema:create('tasks', function(table)
        table:increments('id')
        table:text('name')
        table:text('content')
        table:timestamps()
    end)
end

function _M:down(schema)

    schema:drop('tasks')
end

return _M

