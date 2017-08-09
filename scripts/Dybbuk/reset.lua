local config = {
    backToLevel = 8,
    redskull = false, -- need to be without redskull to reset?
    battle = true, -- need to be without battle to reset?
    pz = false, -- need to be in protect zone to reset?
    stages = {
        {resets = 4, level = 350, premium = 330, vip = 10},
        {resets = 9, level = 400, premium = 380, vip = 12},
        {resets = 14, level = 450, premium = 430, vip = 15},
        {resets = 19, level = 500, premium = 480, vip = 18},
        {resets = 24, level = 530, premium = 510, vip = 20},
        {resets = 29, level = 560, premium = 540, vip = 22},
        {resets = 34, level = 590, premium = 570, vip = 25},
        {resets = 39, level = 620, premium = 600, vip = 28},
        {resets = 44, level = 640, premium = 620, vip = 30},
        {resets = 49, level = 660, premium = 640, vip = 32},
        {resets = 54, level = 680, premium = 660, vip = 35},
        {resets = 59, level = 700, premium = 680, vip = 38},
        {resets = 64, level = 750, premium = 730, vip = 40},
        {resets = 69, level = 800, premium = 780, vip = 45},
        {resets = 74, level = 850, premium = 830, vip = 50},
        {resets = 2^1024, level = 900, premium = 850, vip = 60}
    }
}

function onSay(cid, words, param)
    local player = Player(cid)
    local function getExperienceForLevel(lv)
        lv = lv - 1
        return ((50 * lv * lv * lv) - (150 * lv * lv) + (400 * lv)) / 3
    end
 
    local function getPlayerResets()
        local resets = player:getStorageValue(500)
        return resets < 0 and 0 or resets
    end
    
    local function doPlayerAddResets(count)
        player:setStorageValue(500, getPlayerResets() + count)
    end
    
    if config.redskull and player:getSkull() == 4 then
        player:sendCancelMessage("You need to be without red skull to reset.")
        return false
    elseif config.pz and not getTilePzInfo(player:getPosition()) then
        player:sendCancelMessage("You need to be in protection zone to reset.")
        return false
    elseif config.battle and player:getCondition(CONDITION_INFIGHT) then
        player:sendCancelMessage("You need to be without battle to reset.")
        return false
    end
    
    local resetLevel = 0
    for x, y in ipairs(config.stages) do
        if getPlayerResets() < y.resets then
            resetLevel = player:isVip() and y.premium or y.level
            puntos = y.vip
            break
        end
    end
    
    if getPlayerLevel(player) < resetLevel then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You need level " .. resetLevel .. " or more to reset. Now you have " .. getPlayerResets() .. " " .. (getPlayerResets() == 1 and "reset" or "resets") .. ".")
        return false
    end
    
    doPlayerAddResets(1)
    --local healthMax, manaMax, health, mana = player:getMaxHealth(), player:getMaxMana(), player:getHealth(), player:getMana()
    local name = player:getName()
    player:removeExperience(getExperienceForLevel(player:getLevel()) - getExperienceForLevel(config.backToLevel))
    player:setMaxHealth(1000)
    player:setMaxMana(1000)
    player:addHealth(1000)
    player:addMana(1000)
	player:setCoins(puntos)
    player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Now you have " .. getPlayerResets() .. " " .. (getPlayerResets() == 1 and "reset" or "resets") .. " and You now have ".. puntos .." more Premium Points!.")
    db.query("INSERT INTO `players` (`cap`) VALUES (3000) WHERE name=".. name .."")
    return false
end