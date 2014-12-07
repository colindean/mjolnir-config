-- @colindean's mjolnir configuration

package.path = package.path .. ";" .. os.getenv("HOME") .. "/.mjolnir/?.lua"

require "window_mgmt"

local alert = require "mjolnir.alert"
alert.show("🔨 ⏰")
