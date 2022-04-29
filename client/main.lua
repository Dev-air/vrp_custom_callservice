Config = {
   Calllocation = {
        {coords = vector3(255.99264526367,228.23608398438,106.28677368164-1)},
        {coords = vector3(253.82302856445,228.96408081055,101.6831741333-1)}
    },
}

Citizen.CreateThread(function()
    while true do
	    Citizen.Wait(1)
		for k,v in pairs(Config.Calllocation) do
		    if(Vdist(GetEntityCoords(PlayerPedId()), v.coords) < 15.0)then
                DrawMarker(27, v.coords, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.5001, 30, 220, 30, 220, 0, 0, 0,0)
		    	if(Vdist(GetEntityCoords(PlayerPedId()), v.coords) < 1.5)then
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('air:callservices',source)
                    Citizen.Wait(9999)
                    end
                end
		    end
	    end
	end
end)