function onTargetTile(creature, position)
    local tile = Tile(position)
    if not tile then
        return false
    end

    local football = tile:getItemById(2109)
    if football then
        local playerPosition, footballPosition = creature:getPosition(), football:getPosition()
        playerPosition:sendDistanceEffect(footballPosition, CONST_ANI_WHIRLWINDCLUB)
        footballPosition:sendMagicEffect(CONST_ME_HITAREA)

        local distance = playerPosition:getDistance(footballPosition)
        local nextPosition = footballPosition
        for i = 1, (6 - distance) do
            nextPosition:getNextPosition(creature:getDirection())
            if nextPosition:isWalkable(false) then
                football:moveTo(nextPosition)
            else
                break
            end
        end

        creature:say("POWER SHOOT!", TALKTYPE_MONSTER_SAY)
    end  
end

local powerShoot = Combat()
powerShoot:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile")
powerShoot:setArea(createCombatArea(AREA_SHOOTRANGE, AREADIAGONAL_SHOOTRANGE))

function onSay(player, words, param)
        local position = player:getPosition()
        position:getNextPosition(player:getDirection())

    if param == "shoot" then
        local tile = Tile(position)
        if not tile then
            return false
        end

        local football = tile:getItemById(2109)
        if football then
            position:sendMagicEffect(CONST_ME_GROUNDSHAKER)
            for i = 1, 3 do
                position:getNextPosition(player:getDirection())
                if position:isWalkable(true) then
                    football:moveTo(position)
                else
                    break
                end
            end

            player:say("SHOOT!", TALKTYPE_MONSTER_SAY)
        end
    elseif param == "powershoot" then
        powerShoot:execute(player, positionToVariant(position))
    end
    return false
end