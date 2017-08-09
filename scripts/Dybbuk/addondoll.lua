            function onSay(cid, words, param)   
			   local femaleOutfits = { ["citizen"]={136}, ["hunter"]={137}, ["mage"]={138}, ["knight"]={139}, ["noblewoman"]={140}, ["summoner"]={141}, ["warrior"]={142}, ["barbarian"]={147}, ["druid"]={148}, ["wizard"]={149}, ["oriental"]={150}, ["pirate"]={155}, ["assassin"]={156}, ["beggar"]={157}, ["shaman"]={158}, ["norsewoman"]={252}, ["nightmare"]={269}, ["jester"]={270}, ["brotherhood"]={279}, ["demonhunter"]={288}, ["yalaharian"]={324}, ["warmaster"]={336},["wayfarer"]={366}, ["afflicted"]={431}, ["elementalist"]={433}, ["deepling"]={464}, ["insectoid"]={466} }
               local maleOutfits = { ["citizen"]={128}, ["hunter"]={129}, ["mage"]={130}, ["knight"]={131}, ["nobleman"]={132}, ["summoner"]={133}, ["warrior"]={134}, ["barbarian"]={143}, ["druid"]={144}, ["wizard"]={145}, ["oriental"]={146}, ["pirate"]={151}, ["assassin"]={152}, ["beggar"]={153}, ["shaman"]={154}, ["norseman"]={251}, ["nightmare"]={268}, ["jester"]={273}, ["brotherhood"]={278}, ["demonhunter"]={289}, ["yalaharian"]={325}, ["warmaster"]={335}, ["wayfarer"]={367}, ["afflicted"]={430}, ["elementalist"]={432}, ["deepling"]={463}, ["insectoid"]={465} }
               local player, param = Player(cid), string.lower(param)
                local addondoll_id = 9693
               
               if player:getItemCount(addondoll_id) > 0 then
                    if param ~= "" and maleOutfits[param] and femaleOutfits[param] then
                        local outfit = player:getSex() == 0 and femaleOutfits[param][1] or maleOutfits[param][1]
                        if not player:hasOutfit(outfit, 3) then
                            player:removeItem(addondoll_id, 1)
                            player:sendTextMessage(MESSAGE_INFO_DESCR, "Su Addon full le entregado!")
                            Position(getThingPos(cid)):sendMagicEffect(CONST_ME_GIFT_WRAPS)
                            player:addOutfitAddon(outfit, 3)
                        else
                            player:sendTextMessage(MESSAGE_INFO_DESCR, "usted ya tiene ese addon")
                        end
                    else
                        player:sendTextMessage(MESSAGE_INFO_DESCR, "escriva nuevamente, algo estara mal!")
                    end
                else
                    player:sendTextMessage(MESSAGE_INFO_DESCR, "usted no tiene addon doll!")
                end
            end