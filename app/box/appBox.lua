
local lx, _M = oo{
	_cls_	= '',
	_ext_ 	= 'box'
}

local app, lf, tb, str, new = lx.kit()

function _M:reg()

	app:bind('context', '.app.http.context')
    app:bind('controller', '.app.http.ctler.controller')
	app:bind('exception.handler', '.app.excp.handler')

	app:single('.app.http.bar.verifyCsrfToken')
end

function _M:boot()

end

return _M

