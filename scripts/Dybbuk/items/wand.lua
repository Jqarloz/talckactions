function onSay(cid, words, param)
local player, param = Player(cid), string.lower(param)
local token_id = 21399
local arma_id = 7958

if (player:getItemCount(token_id) > 0) then
if (player:getItemCount(arma_id) > 0) then
player:removeItem(token_id, 1)
player:removeItem(arma_id, 1)
doPlayerAddItem(cid, 2184, 1)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "YOU HAS UPDATE YOUR WAND.")
doSendMagicEffect(getPlayerPosition(cid), 15)
else
doPlayerSendCancel(cid, "YOU NEED A Jester Staff!")
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "YOU NEED A Jester Staff!")
doSendMagicEffect(getPlayerPosition(cid), 2)
end
else
doPlayerSendCancel(cid, "YOU NEED A GOLDEN RAID TOKEN!")
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "YOU NEED A GOLDEN RAID TOKEN!")
doSendMagicEffect(getPlayerPosition(cid), 2)
end
end