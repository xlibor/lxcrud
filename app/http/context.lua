
local _M = {
	_cls_ = 'app.http.context',
	_ext_ = {
		path = 'lxlib.http.context',
	}
}

function _M:init()

end

function _M:_get_(key)

	return self:__super('_get_', key)
end


return _M

