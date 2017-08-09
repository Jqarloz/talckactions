function onSay(cid, words, param)
    local promotion = player:getVocation():getPromotion()
    if (isPlayer(cid)) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You are already promoted!')
        return false
    end

    player:setVocation(Vocation(promotion:getId()))
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You are now promoted.')
    return false
end