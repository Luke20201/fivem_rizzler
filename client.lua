-- Handle translations here --
local sigma = {
    {label = "I have GYATT to get your number" , icon = "fas fa-face-grin-hearts"},
    {label = "You're so sigma, you cured me of my ligma" , icon = "fas fa-infinity"},
    {label = "Hey baby, call me the rizzler Ohio sigma" , icon = "fas fa-flag-usa"},
}

-- Script -- 
nameCount = 1
AddEventHandler("onClientResourceStart", function(resName)
    if resName ~= GetCurrentResourceName() then return end
    for _, rizz in pairs(sigma) do 
        params = {
            label = rizz.label,
            icon = rizz.icon,
            event = "dw_rizzler:rizzUp"
        }
        local options = FrameworkParams(params)
        AddTargets(options)
    end
end)

function FrameworkParams(params)
    local options = params
    if Config.target == "ox" then 
        options.name = "rizz_" .. nameCount
        nameCount = nameCount + 1
        options.distance = 3
    elseif Config.target == "qb" then
        options.type = "client"
    end
    return options
end

function AddTargets(params)
    if Config.target == "ox" then 
        exports.ox_target:addGlobalPed(params)
    elseif Config.target == "qb" then
        parameters = {}
        parameters.options = params 
        parameters.distance = 3
        exports['qb-target']:AddGlobalPed(params)
    end
end

RegisterNetEvent("dw_rizzler:rizzUp", function(data)
    local ped = data.entity
    if math.random(0, 100) < Config.chanceToGetBeatUp then
        print("Rizzjected")
        SetRelationshipBetweenGroups(5, GetHashKey('PLAYER'), GetHashKey(ped))
        SetRelationshipBetweenGroups(5, GetHashKey(ped), GetHashKey('PLAYER'))
        TaskCombatPed(ped, PlayerPedId(), 0, 16)
    else
        print("Rizzed em up")
        TriggerEvent("InteractSound_CL:PlayOnOne", "dw_rizz", 1)
        -- If people pay a total of €50 for this script I will add E-girlfriends ig?
        -- Pls don't
    end
end)