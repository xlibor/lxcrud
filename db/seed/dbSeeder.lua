
local lx, _M = oo{
    _cls_ = '',
    _ext_ = 'seeder'
}

local app, lf, tb, str, new = lx.kit()

local Model = lx.use('model')

local fair = lx.h.fair
local rand = lf.random

function _M:run()

    new(Task):truncate()
    Model.unguard()

    Task.create{
        name = 'Task1',
        content = 'do some job 1'
    }

    Task.create{
        name = 'Task2',
        content = 'do some job 2'
    }
end

return _M

