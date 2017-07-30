
local _M = {
	_cls_	= 'app.db.listener',
	_ext_	= {
		path = 'lxlib.db.event.listener'
	}
}

local mt = { __index = _M }

local ddt = require('lxlib.db.common').ddt
local lx = require('lxlib')

local getDt = lx.f.datetime
local getTime = lx.f.timestamp
local getGuid = lx.f.guid

local function trace(q, action)
 
	local r = q.reqCtx
	local dbo = q._dbo
	local dboName = dbo._tblName
	ngx.say(dboName .. '-' .. action)
 
end

function _M:beforeSave(q)
	
end

function _M:beforeInsert(q)
 
end

function _M:beforeUpdate(q)

end

function _M:beforeDelete(q)

end

function _M:beforeSelect(q)
 
end

function _M:aroundSelect(q, sqlSelect)
 
end

function _M:aroundSave(q, sqlSave)

	local dbo = q._dbo
	local tblName = dbo._tblName
 
	local fields = sqlSave.fields 

	if tblName == 'user' then
		local nameField, nickNameField = fields.items.name, fields.items.nickName
		if nameField then
			nameField.value = string.gsub(nameField.value, '[%p%s]','')
		end
		if nickNameField then 
			nickNameField.value = string.gsub(nickNameField.value, '[%p%s]','')
		end
	end
	
end

function _M:aroundInsert(q, sqlInsert)
 
	local dbo = q._dbo
	local tblName = dbo._tblName
 
	local fields = sqlInsert.fields 
	local pkName = dbo.primaryKey
	local pkField = fields.items[pkName]
 
	if pkName and not pkField then
		fDataType = dbo.pkDataType
		if fDataType == ddt.char then
			local guid = getGuid()
			fields:add( pkName, guid )
		end
	end
	
	local curTime, curDt = getTime(), getDt()
	local tblDef = dbo.tblDef

	if not tblDef then return end

	local createTime, updateTime, recordTime = 
		  tblDef.createTime, tblDef.updateTime, tblDef.recordTime
		
	if createTime then
		local ctField = fields.items.createTime
		if not ctField then
			fields:add( 'createTime', curDt )
		end
	end
	if updateTime then
		local utField = fields.items.updateTime
		if not utField then
			fields:add( 'updateTime', curDt )
		end
	end
	if recordTime then
		local utField = fields.items.recordTime
		if not utField then
			fields:add( 'recordTime', curTime )
		end
	end
end

function _M:aroundUpdate(q, sqlUpdate)

	local dbo = q._dbo
	local tblName = dbo._tblName
 
	local fields = sqlUpdate.fields 
	
	local curTime, curDt = getTime(), getDt()
	local tblDef = dbo.tblDef

	if not tblDef then return end

	local updateTime = tblDef.updateTime

	if updateTime then
		local utField = fields.items.updateTime
		if not utField then
			fields:add( 'updateTime', curDt )
		end
	end

	local recordTime = tblDef.recordTime
 
	if recordTime then
		local utField = fields.items.recordTime
		if not utField then
			fields:add( 'recordTime', curTime )
		end
	end
end

function _M:aroundDelete(q, sqlDelete)

end

function _M:afterSave(q)

end

function _M:afterInsert(q)

end

function _M:afterUpdate(q)

end

function _M:afterDelete(q)
	
end
 
function _M:afterSelect(q)
	-- print(q.sql)
end

return _M
