
local lx = require('lxlib')
local env = lx.env

local conf = {
	key             = env('appKey'),
	namespace		= '.app.http.ctler',
	debug			= true,
	locale			= 'zh_cn',
	fallbackLocale	= 'en',
	timezone 		= 'Asia/Shanghai',

	boxes = {
		'lxlib.auth.authBox',
		'lxlib.cookie.cookieBox',
		'lxlib.session.sessionBox',
		'lxlib.cache.cacheBox',
		'lxlib.db.dbBox',
		'lxlib.redis.redisBox',
		'lxlib.view.viewBox',
		'lxlib.log.logBox',
		'lxlib.validation.validationBox',
		'lxlib.translation.translationBox',
		'lxlib.pagination.paginationBox',
		'lxlib.net.netBox',
		'lxlib.crypt.cryptBox',
		'lxlib.hash.hashBox',
		'lxlib.dt.dtBox',
		'.app.box.routeBox',
		'.app.box.appBox',
		'.app.box.dbBox',
	},

	faces = {
		App 		= 'app',
		Auth 		= 'auth',
		Cache		= 'cache@get',
		Conf		= 'config@get',
		Cookie		= 'cookie',
		Crypt		= 'crypt',
		Db			= 'db@table',
		Dt   		= 'datetime',
		Event		= 'events',
		Fs			= {'files', nil, true},
		Gate		= 'gate',
		Hash 		= 'hash@make',
		Lang		= 'translator',
		Log 		= 'logger',
		Redis 		= 'redis',
		Req			= 'request@input',
		Resp		= 'response',
		Route		= 'router',
		Session		= 'session.store@get',
		Validator	= 'validator',
		View		= 'view',
		Schema		= 'db.schema',

		Task		= '.app.model.task',
	}
}

return conf

