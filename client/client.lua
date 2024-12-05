local mzloops = {iya = {}}
local loopsId = {}
local nearPly = {}

local matiin = function(id) -- Function Mematikan Loop
    if mzloops.iya[id] then
        mzloops.iya[id].status = false
    end
end

local puterin = function(_function, tickTime, dontstart) -- Function Memulai Loop
    local loopId = math.random(11111111,5555555555)
    mzloops.iya[loopId] = {status = true, func = _function, tick = tickTime}
    if dontstart ~= false then
        CreateThread(function()
            while mzloops.iya[loopId] and mzloops.iya[loopId].status do
                _function(loopId)
                Wait(tickTime or 1)
            end
        end)
    end
    return loopId
end

local function pake3d(x, y, z, text) -- Function Show 3D Text di atas kepala player
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        local dist = GetDistanceBetweenCoords(GetGameplayCamCoords(), x, y, z, 1)
        local scale = 1.5 * (1 / dist) * (1 / GetGameplayCamFov()) * 100
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropShadow(0, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextEdge(4, 0, 0, 0, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

local function toggleIdKepala(state) -- Function Toggle Id Kepala
    if state then
        nearPly = lib.getNearbyPlayers(GetEntityCoords(cache.ped), 0.7)
        loopsId = puterin(function()
            if #nearPly >= 1 then
                for i=1,#nearPly do
                    local id = GetPlayerServerId(nearPly[i].id)
                    local warna = Player(id).state?.warnaId or '~w~'
                    local addontxt = Player(id).state?.addonId or ''
                    local ped = nearPly[i].ped
                    local lok = GetEntityCoords(ped)
                    local x,y,z = lok[1], lok[2], lok[3]
                    pake3d(x, y, z + 1.03, warna..id..' - '..addontxt)
                end
            end

            local myid = GetPlayerServerId(PlayerId())
            local myped = cache.ped or PlayerPedId()
            local warna = LocalPlayer.state?.warnaId or '~w~'
            local addontxt = LocalPlayer.state?.addonId or ''
            local mylok = GetEntityCoords(myped)
            local myx,myy,myz = mylok[1], mylok[2], mylok[3]
            pake3d(myx, myy, myz + 1.03, warna..myid..' - '..addontxt)
        end, 0)
    else
        nearPly = {}
        matiin(loopsId)
    end
end

exports('toggleIdKepala', toggleIdKepala) -- exports show toggle id kepala

RegisterCommand('+idkepala', function() 
    if not LocalPlayer.state.invOpen then -- Validasi tidak bisa menggunakan toggle ketika buka inventory
        toggleIdKepala(true) 
    end
end)
RegisterCommand('-idkepala', function() 
    if not LocalPlayer.state.invOpen then -- Validasi tidak bisa menggunakan toggle ketika buka inventory
        toggleIdKepala(false) 
    end
end)
RegisterKeyMapping('+idkepala', 'Toggle ID', 'keyboard', 'U')