local config =
{
   --["mount"] = {id = x},
    ["widow queen"] = {price = 0, id = 1}, 
	["racing bird"] = {price = 0, id = 2},
	["war bear"] = {price = 0, id = 3},
	["blacks heep"] = {price = 0, id = 4},
	["midnight panther"] = {price = 0, id = 5},
	["draptor"] = {price = 0, id = 6},
	["titanica"] = {price = 0, id = 7},
	["tin lizzard"] = {price = 0, id = 8},
	["blazebringer"] = {price = 0, id = 9},
	["rapid boar"] = {price = 0, id = 10},
	["stampor"] = {price = 0, id = 11},
	["undead cavebear"] = {price = 0, id = 12},
	["donkey"] = {price = 0, id = 13},
	["tiger slug"] = {price = 0, id = 14},
	["uniwheel"] = {price = 0, id = 15},
	["crystal wolf"] = {price = 0, id = 16},
	["kingly deer"] = {price = 0, id = 18},
	["tamed panda"] = {price = 0, id = 19},
	["dromedary"] = {price = 0, id = 20},
	["sandstone scorpion"] = {price = 0, id = 21},
	["fire war horse"] = {price = 0, id = 23},
	["shadow draptor"] = {price = 0, id = 24},
	["lady bug"] = {price = 0, id = 27},
	["manta"] = {price = 0, id = 28},
	["ironblight"] = {price = 0, id = 29},
	["magma crawler"] = {price = 0, id = 30},
	["dragonling"] = {price = 0, id = 31},
	["gnarlhound"] = {price = 0, id = 32},
	["red manta"] = {price = 0, id = 33},
	["mechanical bird"] = {price = 0, id = 34},
	["water buffalo"] = {price = 0, id = 35},
	["the hellgrip"] = {price = 0, id = 39},
	["tombstinger"] = {price = 0, id = 36},
	["platesaurian"] = {price = 0, id = 37},
	["ursagrodon"] = {price = 0, id = 38},
	["noble lion"] = {price = 0, id = 40},
	["desert king"] = {price = 0, id = 41},
	["shockhead"] = {price = 0, id = 42},
	["walker"] = {price = 0, id = 43}
}

function onSay(cid, words, param)

   local player, t, mountdoll_id = Player(cid), config[string.lower(param)], 13030 -- id do mount doll
   
   if (player:getItemCount(mountdoll_id) > 0) then
        if (param ~= "" and t) then
         if(t and not player:hasMount(t.id)) then  
            player:removeItem(mountdoll_id, 1)
                player:sendTextMessage(MESSAGE_INFO_DESCR, "Felicidades mount nueva!")
            player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
            player:addMount(t.id)
            else
            player:sendCancelMessage("Ya tienes esta mount.")
            end
        else
         player:sendCancelMessage("Escribe bien lo que quieres!")
        end
    else
      player:sendCancelMessage("No cuenta con mount doll!")
    end

   return true
end