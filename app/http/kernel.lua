
local _M = {
	_cls_ = '',
	_ext_ = {
		path = 'lxlib.http.kernel'
	},
	bars = {
	},
	routeBars = {
	},
	barGroup = {
		web = {
			'lxlib.cookie.bar.addToResponse',
			'lxlib.session.bar.startSession',
			'lxlib.view.bar.shareErrorsFromSession',
			'.app.http.bar.verifyCsrfToken'
		}
	}
}

function _M:ctor()

	self:initBars()
end

return _M

