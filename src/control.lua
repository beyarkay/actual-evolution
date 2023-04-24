---@diagnostic disable: unused-local

-- Dump the object as a string
local function dump(o)
    if o == nil then
        return "nil"
    end
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end
---Register a command so that you can in-game go `\c get_global genes` and it
--will print out the global data `genes`
---@param key string: The key of the global to get
commands.add_command("get_global", nil,
    function(key)
        game.print(dump(global[key.parameter]))
    end
)

function init_genes()
    local nauvis = game.get_surface(1)
    local enemies = nauvis.find_entities_filtered { force = "enemy" }
    global.genes = {}
    for i, entity in ipairs(enemies) do
        global.genes[entity.unit_number] = {
            speed_factor = math.random()
        }
    end
end
script.on_init(init_genes)

-- when an enemy is spawned, give it some genes
script.on_event(defines.events.on_entity_spawned, function(event)
    local entity = event.entity
    if global.genes == nil then
        init_genes()
    end
    global.genes[entity.unit_number] = {
        speed = math.random(),
    }
    local cmd_goto_origin = {
        type = defines.command.go_to_location,
        destination = {0,0},
        pathfind_flags = { cache = true, prefer_straight_paths = true },
        distraction = defines.distraction.none,
        radius = 3
    }
    local cmd_stop = {
        type = defines.command.stop,
        distraction = defines.distraction.none,
    }
    entity.set_command({
        type = defines.command.compound,
        structure_type = defines.compound_command.return_last,
        commands = {
            cmd_goto_origin,
            cmd_stop,
        }
    })
end)

script.on_event(defines.events.on_tick, function(event)
end)

