
local lx, _M = oo{
	_cls_ = '',
	_ext_ = 'model',
}

function _M:ctor()

	self.table = 'tasks'
	self.fillable = {'name', 'content'}
end

return _M

