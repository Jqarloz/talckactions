local config =
{
   --["mount"] = {id = x},
   ["azudocus"] = {id = 44},
   ["carpacosaurus"] = {id = 45},
   ["death crawler"] = {id = 46},
   ["flamesteed"] = {id = 47},
   ["jade lion"] = {id = 48},
   ["jade pincer"] = {id = 49},
   ["nethersteed"] = {id = 50},
   ["tempest"] = {id = 51},
   ["winter king"] = {id = 52},
   ["doombringer"] = {id = 53},
   ["woodland prince"] = {id = 54},
   ["hailtorm fury"] = {id = 55},
   ["siegebreaker"] = {id = 56},
   ["poisonbane"] = {id = 57},
   ["blackpelt"] = {id = 58},
   ["golden dragonfly"] = {id = 59},
   ["steel bee"] = {id = 60},
   ["copper fly"] = {id = 61},
   ["tundra rambler"] = {id = 62},
   ["highland yak"] = {id = 63},
   ["glacier vagabond"] = {id = 64},
   ["flying divan"] = {id = 65},
   ["magic carpet"] = {id = 66},
   ["floating kashmir"] = {id = 67},
   ["ringtail waccoon"] = {id = 68},
   ["night waccoon"] = {id = 69},
   ["emerald waccoon"] = {id = 70},
   ["glooth glider"] = {id = 71},
   ["shadow hart"] = {id = 72},
   ["black stag"] = {id = 73},
   ["emperor deer"] = {id = 74}
}

function onSay(cid, words, param)

   local player, t, mountdoll_id = Player(cid), config[string.lower(param)], 20624 -- id do mount doll
   
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