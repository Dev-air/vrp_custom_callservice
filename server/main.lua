local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_callservices")

local config = {}

config.airmsg = {"\"",false}

RegisterNetEvent('air:callservices')
AddEventHandler('air:callservices', function(player)
  local player = source
  local user_id = vRP.getUserId({player})
  local Security_Job = "banking.add" -- 해당 직업 (권한)을 가지고 있는사람만 경찰,특공대 콜 활성화
  if vRP.hasPermission({user_id,Security_Job}) then
	  vRPclient.getPosition(player,{},function(x,y,z)
    --vRP.prompt({player,"필요한 경우 서비스 메세지를 입력하십시오. :","~r~은행 강도 발생! ~b~경찰,특공대 ~y~전원 출동바람!",function(player, msg)
        msg = "~r~은행 강도 발생! ~b~경찰,특공대 ~y~전원 출동바람!"
        vRPclient.notify(player,{"~b~경찰,특공대를 호출했습니다."})
        vRP.sendServiceAlert({player,"112 긴급",x,y,z,msg})
        vRP.sendServiceAlert({player,"특공대",x,y,z,msg})
        --vRP.sendServiceAlert({player,"수도방위사령부 긴급",x,y,z,msg})
      --end})
	  end)
	else
		vRPclient.notify(player,{"~r~권한이 없습니다."})
	end
end)