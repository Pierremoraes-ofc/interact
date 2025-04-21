local BackEngineVehicles = {
    [`ninef`] = true,
    [`adder`] = true,
    [`vagner`] = true,
    [`t20`] = true,
    [`infernus`] = true,
    [`zentorno`] = true,
    [`reaper`] = true,
    [`comet2`] = true,
    [`comet3`] = true,
    [`jester`] = true,
    [`jester2`] = true,
    [`cheetah`] = true,
    [`cheetah2`] = true,
    [`prototipo`] = true,
    [`turismor`] = true,
    [`pfister811`] = true,
    [`ardent`] = true,
    [`nero`] = true,
    [`nero2`] = true,
    [`tempesta`] = true,
    [`vacca`] = true,
    [`bullet`] = true,
    [`osiris`] = true,
    [`entityxf`] = true,
    [`turismo2`] = true,
    [`fmj`] = true,
    [`re7b`] = true,
    [`tyrus`] = true,
    [`italigtb`] = true,
    [`penetrator`] = true,
    [`monroe`] = true,
    [`ninef2`] = true,
    [`stingergt`] = true,
    [`surfer`] = true,
    [`surfer2`] = true,
    [`gp1`] = true,
    [`autarch`] = true,
    [`tyrant`] = true
    }

    local function ToggleDoor(vehicle, door)
        if GetVehicleDoorLockStatus(vehicle) < 2 then
            if GetVehicleDoorAngleRatio(vehicle, door) > 0.0 then
                SetVehicleDoorShut(vehicle, door, false)
            else
                SetVehicleDoorOpen(vehicle, door, false)
            end
        end
    end

return {
    Debug = GetConvar('debug', 'false') == 'true' and true or false, -- Enable / Disable debug mode
    Style = 'obtaizen_ui', -- gold_circle (default), blue_circle, green_square, glitch 
    Textures = { -- Do not change
        pin = 'point',
        interact = 'key',
        selected = 'label',
        unselected = 'label_no',
        select_opt = 'circle_selected',
        unselect_opt = 'circle',
    },
    Disable = {
        onDeath = true, -- Disable interactions on death
        onNuiFocus = true, -- Disable interactions while NUI is focused
        onVehicle = true, -- Disable interactions while in a vehicle
        onHandCuff = true, -- Disable interactions while handcuffed
    },

    -- Nearby object distance check.
    nearbyObjectDistance = 20.0, -- Keep it at 15.0 at minimum.
    nearbyVehicleDistance = 4.0,
    
    -- Wall detection settings
    wallDetection = {
        enabled = true, -- Enable/disable wall detection for interactions
        rayFlags = 1 + 4 + 16 + 256, -- Ray flags for wall detection (1=buildings, 4 npc, 16=vehicles, 256=peds)
    },

    vehicleBoneDefaults = {
        enabled = true,
        bones = {
            ['boot']= {
                distance = 3.5,
                interactDst = 2.0,
                offset = vec3(0.0, 1.0, 0.0),
                options = {
                    {
                        name = 'interact:trunk',
                        label = 'Porta-malas',
                        action = function(entity)
                            TriggerEvent('ox_inventory:openInventory', 'trunk', {
                                id = 'trunk'..GetVehicleNumberPlateText(entity),
                                netid = NetworkGetNetworkIdFromEntity(entity),
                                entityid = entity,
                                door = BackEngineVehicles[GetEntityModel(entity)] and 4 or 5
                            })
                            --ToggleDoor(entity, BackEngineVehicles[GetEntityModel(entity)] and 4 or 5)
                        end,
                    }
                },
            }
        }
    },
}
