            function onSay(cid, words, param)   
			   local femaleOutfits = { ["entrepreneur"]={471}, ["crystal warlord"]={513}, ["soil guardian"]={514}, ["demon"]={542}, ["cave explorer"]={575}, ["dream warden"]={578}, ["conjurer"]={635}, ["beastmaster"]={636}, ["champion"]={632}, ["glooth engineer"]={618}, ["chaos acolyte"]={664}, ["death herald"]={666}, ["ranger"]={683}, ["ceremonial garb"]={694}, ["marionette's puppeteer"]={696}, ["variant on shaman"]={698}, ["evoker"]={724}, ["neptune"]={732} }
               local maleOutfits = { ["entrepreneur"]={472}, ["crystal warlord"]={512}, ["soil guardian"]={516},["demon"]={541}, ["cave explorer"]={574}, ["dream warden"]={577}, ["conjurer"]={634}, ["beastmaster"]={637}, ["champion"]={633}, ["glooth engineer"]={610}, ["chaos acolyte"]={665}, ["death herald"]={667}, ["ranger"]={684}, ["ceremonial garb"]={695}, ["marionette's puppeteer"]={697}, ["variant on shaman"]={699}, ["evoker"]={725}, ["neptune"]={733} }
               local player, param = Player(cid), string.lower(param)
                local addondoll_id = 16108
               
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