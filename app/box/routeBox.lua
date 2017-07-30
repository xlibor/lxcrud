
local lx, _M = oo{
	_cls_ = '',
	_ext_ = {path = 'lxlib.routing.routeBox'}
}

local app, lf, tb, str = lx.kit()
local fs = lx.fs

function _M:boot()

	local router = app:get('router')

	self.router = router
	self:__super('boot')
end

function _M:map()
 	
 	local route = self.router
 	local namespace = app:conf('app.namespace')
 	
 	route:prefix('/'):bar('web')
 		:namespace(namespace)
 		:group(require('.map.web'))

 	route:prefix('api'):bar('api')
 		:namespace(namespace)
 		:group(require('.map.api'))

	self:autoload()
end

function _M:autoload()

	local router = self.router

	local routes = fs.files(lx.dir('map', 'load'), 'n', function(file)
        local name, ext = file:sub(1, -5), file:sub(-3)

        if ext == 'lua' then
            return name
        end
	end)
	if #routes > 0 then
		for _, route in ipairs(routes) do
			require('.map.load.' .. route)(router)
		end
	end

end

return _M

