-- Setting player inventory
local function main(e)
	local player = game.players[e.player_index]	
	if not player.get_main_inventory() then return end
	
	-- Main inventory
	player.insert{name="construction-robot", count = 50}
	player.insert{name = "fusion-reactor-equipment", count = 2}
	player.insert{name = "personal-roboport-mk2-equipment", count = 2}
	player.insert{name = "exoskeleton-equipment", count = 5}
	player.insert{name = "battery-mk2-equipment", count = 4}
	player.insert{name = "solar-panel-equipment", count = 7}
	player.insert{name = "belt-immunity-equipment", count = 1}
	player.insert{name = "perfect-night-glasses", count = 1}

	-- Guns
	player.get_inventory(defines.inventory.character_guns).clear()
	player.get_inventory(defines.inventory.character_ammo).clear()
	
	-- Worker robot cargo size research (5 tiers in Vanilla)
	player.force.technologies['worker-robots-speed-1'].researched = true
	player.force.technologies['worker-robots-speed-2'].researched = true
	player.force.technologies['worker-robots-speed-3'].researched = true
	player.force.technologies['worker-robots-speed-4'].researched = true	
	player.force.technologies['worker-robots-speed-5'].researched = true
	-- Worker robot cargo size research (3 tiers in Vanilla)
	player.force.technologies['worker-robots-storage-1'].researched = true
	player.force.technologies['worker-robots-storage-2'].researched = true
	player.force.technologies['worker-robots-storage-3'].researched = true
end

local function player_created(e)
	main(e)
end

local function cutscene_cancelled(e)
  if remote.interfaces["freeplay"] then
    main(e)
  end
end

script.on_event(defines.events.on_player_created,player_created)
script.on_event(defines.events.on_cutscene_cancelled,cutscene_cancelled)