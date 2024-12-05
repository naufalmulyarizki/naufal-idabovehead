if GetResourceState("es_extended") == 'started' then -- Mendapatkan Apakah Resource Core ESX Starting
    ESX = exports["es_extended"]:getSharedObject()
elseif GetResourceState("qb-core") == 'started' then -- Mendapatkan Apakah Resource Core QB-Core Starting
    QBCore = exports['qb-core']:GetCoreObject()
elseif GetResourceState("qbx_core") == 'started' then -- Mendapatkan Apakah Resource Core qbx_core Starting
    --
end

lib.addCommand('idonhead', {
    restricted = 'group.admin',
    help = 'Atur Warna dan Additional Text pada ID diatas Kepala',
    params = {
        {type = 'playerId', name = 'id', help = 'siapa yang mau diubah?', optional = true}
    }
}, function(source, args)
    local id = args.id or source
    if GetResourceState("es_extended") == 'started' then -- Mendapatkan Apakah Resource Core ESX Starting
        local player = ESX.GetPlayerFromId(id) -- Mendapatkan Player Data ESX
        if not player then return end

        local state = {
            text = player.metadata?.addonId or 'none', -- Get Metadata Addonid
            warna = player.metadata?.warnaId or '~w~', -- Get Metadata warnaId
        }

        -- Open Input
        local ip = Naufal.fn.input(source, 'ID on Head Addons', {
            {type = 'input', label = 'Additional Text', description = 'Biarkan none jika mau dikosongkan saja', default = state.text, required = true},
            {type = 'select', label = 'Pilih Warna', required = true, default = state.warna, options = {
                {label = 'White', value = '~w~'},
                {label = 'Red', value = '~r~'},
                {label = 'Green', value = '~g~'},
                {label = 'Blue', value = '~b~'},
                {label = 'Yellow', value = '~y~'},
                {label = 'Grey', value = '~c~'},
                {label = 'Orange', value = '~o~'},
                {label = 'Purple', value = '~p~'},
                {label = 'Pink', value = '~q~'},
                {label = 'Black', value = '~l~'},
                {label = 'Blue Dark', value = '~d~'},
            }}
        })
        if not ip then return end

        -- Set Metadata buat addonId dan warnaId
        player.setMeta('addonId', ip[1])
        player.setMeta('warnaId', ip[2])

        if ip[1] ~= 'none' then
            Player(id).state:set('addonId', ip[1], true)
        else
            Player(id).state:set('addonId', '', true)
        end
        Player(id).state:set('warnaId', ip[2], true)
    elseif GetResourceState("qb-core") == 'started' then -- Mendapatkan Apakah Resource Core QB-Core Starting
        local player = QBCore.Functions.GetPlayer(id) -- GetPlayer ESX
        if not player then return end
    
        local state = {
            text = player.PlayerData.metadata?.addonId or 'none', -- Get Metadata Addonid
            warna = player.PlayerData.metadata?.warnaId or '~w~', -- Get Metadata warnaId
        }

        -- Open Input
        local ip = ham.fn.input(source, 'ID on Head Addons', {
            {type = 'input', label = 'Additional Text', description = 'Biarkan none jika mau dikosongkan saja', default = state.text, required = true},
            {type = 'select', label = 'Pilih Warna', required = true, default = state.warna, options = {
                {label = 'White', value = '~w~'},
                {label = 'Red', value = '~r~'},
                {label = 'Green', value = '~g~'},
                {label = 'Blue', value = '~b~'},
                {label = 'Yellow', value = '~y~'},
                {label = 'Grey', value = '~c~'},
                {label = 'Orange', value = '~o~'},
                {label = 'Purple', value = '~p~'},
                {label = 'Pink', value = '~q~'},
                {label = 'Black', value = '~l~'},
                {label = 'Blue Dark', value = '~d~'},
            }}
        })
        if not ip  then return end
    
        -- Set Metadata buat addonId dan warnaId
        player.Functions.SetMetaData('addonId', ip[1])
        player.Functions.SetMetaData('warnaId', ip[2])
        player.Functions.Save()

        if ip[1] ~= 'none' then
            Player(id).state:set('addonId', ip[1], true)
        else
            Player(id).state:set('addonId', '', true)
        end
        Player(id).state:set('warnaId', ip[2], true)
    elseif GetResourceState("qbx_core") == 'started' then -- Mendapatkan Apakah Resource Core qbx_core Starting
        local player = exports.qbx_core:GetPlayer(id) -- GetPlayer ESX
        if not player then return end
    
        local state = {
            text = player.PlayerData.metadata?.addonId or 'none', -- Get Metadata Addonid
            warna = player.PlayerData.metadata?.warnaId or '~w~', -- Get Metadata warnaId
        }

        -- Open Input
        local ip = ham.fn.input(source, 'ID on Head Addons', {
            {type = 'input', label = 'Additional Text', description = 'Biarkan none jika mau dikosongkan saja', default = state.text, required = true},
            {type = 'select', label = 'Pilih Warna', required = true, default = state.warna, options = {
                {label = 'White', value = '~w~'},
                {label = 'Red', value = '~r~'},
                {label = 'Green', value = '~g~'},
                {label = 'Blue', value = '~b~'},
                {label = 'Yellow', value = '~y~'},
                {label = 'Grey', value = '~c~'},
                {label = 'Orange', value = '~o~'},
                {label = 'Purple', value = '~p~'},
                {label = 'Pink', value = '~q~'},
                {label = 'Black', value = '~l~'},
                {label = 'Blue Dark', value = '~d~'},
            }}
        })
        if not ip  then return end
    
        -- Set Metadata buat addonId dan warnaId
        player.Functions.SetMetaData('addonId', ip[1])
        player.Functions.SetMetaData('warnaId', ip[2])
        player.Functions.Save()

        if ip[1] ~= 'none' then
            Player(id).state:set('addonId', ip[1], true)
        else
            Player(id).state:set('addonId', '', true)
        end
        Player(id).state:set('warnaId', ip[2], true)
    end
end)

if GetResourceState("es_extended") == 'started' then -- Mendapatkan Apakah Resource Core ESX Starting
    AddEventHandler('esx:playerLoaded', function(kantong)
        local player = ESX.GetPlayerFromId(kantong)
        if not player then return end
        local meta = player.metadata
        if meta?.addonId ~= 'none' then
            Player(kantong).state:set('addonId', meta?.addonId, true)
        else
            Player(kantong).state:set('addonId', '', true)
        end
        if meta?.warnaId then
            Player(kantong).state:set('warnaId', meta?.warnaId, true)
        end
    end)
elseif GetResourceState("qbx_core") == 'started' then -- Mendapatkan Apakah Resource Core qbx_core Starting
    RegisterNetEvent('QBCore:Server:OnPlayerLoaded', function()
        local src = source
        local player = exports.qbx_core:GetPlayer(src)
        if not player then return end
        local meta = player.PlayerData.metadata
        if meta?.addonId ~= 'none' then
            Player(src).state:set('addonId', meta?.addonId, true)
        else
            Player(src).state:set('addonId', '', true)
        end
        if meta?.warnaId then
            Player(src).state:set('warnaId', meta?.warnaId, true)
        end
    end)
elseif GetResourceState("qb-core") == 'started' then -- Mendapatkan Apakah Resource Core QB-Core Starting
    RegisterNetEvent('QBCore:Server:OnPlayerLoaded', function()
        local src = source
        local player = exports.qbx_core:GetPlayer(src)
        if not player then return end
        local meta = player.PlayerData.metadata
        if meta?.addonId ~= 'none' then
            Player(src).state:set('addonId', meta?.addonId, true)
        else
            Player(src).state:set('addonId', '', true)
        end
        if meta?.warnaId then
            Player(src).state:set('warnaId', meta?.warnaId, true)
        end
    end)
end