--
-- (C) 2013-22 - ntop.org
--

local dirs = ntop.getDirs()
package.path = dirs.installdir .. "/scripts/lua/modules/?.lua;" .. package.path

require "lua_utils"

local host_pools_nedge = require "host_pools_nedge"
local captive_portal_utils = require("captive_portal_utils")

captive_portal_utils.print_header()

local info = ntop.getInfo()

print [[
  <form id="form_del_user" role="form" data-bs-toggle="validator" class="form-signin" action="]] print(ntop.getHttpPrefix()) print[[/lua/logout.lua]] print[[" method="POST">
    <input type="hidden" class="form-control" name="action" value="logout" />

    <h2 class="form-signin-heading" style="font-weight: bold;">]] print(info["product"]) print [[ Access Portal</h2>
]]

if _POST["action"] == "logout" then -- TODO or check if already logged out

  -- TODO get username and MAC address and do the actual logout
  -- local username = ...
  -- local mac = ...

  -- local pool_id = host_pools_nedge.usernameToPoolId(username) or host_pools_nedge.DEFAULT_POOL_ID
  -- host_pools_nedge.deletePoolMember(pool_id, mac)
  -- ntop.reloadHostPools()

  print[[
    <div class="row">
      <div >&nbsp;</div>
      <div class="col-lg-12">
    ]] print(i18n("login.logged_out")) print[[
      </div>
      <div >&nbsp;</div>
    </div>
    <div class="row">
      <div >&nbsp;</div>
      <div class="col-lg-12">
        <small>
          <p>]] print(info["copyright"]) print [[
        </small>
      </div>
    </div>
  ]]

else
  print[[
    <div class="row">
      <div class="col-lg-12">
    ]] print(i18n("login.logout_message")) print[[
      </div>
      <div >&nbsp;</div>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">]] print(i18n("login.logout")) print[[</button>
    <div class="row">
      <div >&nbsp;</div>
      <div class="col-lg-12">
        <small>
          <p>]] print(info["copyright"]) print [[
        </small>
      </div>
    </div>
  ]]
end

print [[
  </form>
]]

captive_portal_utils.print_footer()

