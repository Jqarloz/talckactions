player_flags = {
   [0] = "CannotUseCombat",
   [1] = "CannotAttackPlayer",
   [2] = "CannotAttackMonster",
   [3] = "CannotBeAttacked",
   [4] = "CanConvinceAll",
   [5] = "CanSummonAll",
   [6] = "CanIllusionAll",
   [7] = "CanSenseInvisibility",
   [8] = "IgnoredByMonsters",
   [9] = "NotGainInFight",
   [10] = "HasInfiniteMana",
   [11] = "HasInfiniteSoul",
   [12] = "HasNoExhaustion",
   [13] = "CannotUseSpells",
   [14] = "CannotPickupItem",
   [15] = "CanAlwaysLogin",
   [16] = "CanBroadcast",
   [17] = "CanEditHouses",
   [18] = "CannotBeBanned",
   [19] = "CannotBePushed",
   [20] = "HasInfiniteCapacity",
   [21] = "CanPushAllCreatures",
   [22] = "CanTalkRedPrivate",
   [23] = "CanTalkRedChannel",
   [24] = "TalkOrangeHelpChannel",
   [25] = "NotGainExperience",
   [26] = "NotGainMana",
   [27] = "NotGainHealth",
   [28] = "NotGainSkill",
   [29] = "SetMaxSpeed",
   [30] = "SpecialVIP",
   [31] = "NotGenerateLoot",
   [32] = "CanTalkRedChannelAnonymous",
   [33] = "IgnoreProtectionZone",
   [34] = "IgnoreSpellCheck",
   [35] = "IgnoreWeaponCheck",
   [36] = "CannotBeMuted",
   [37] = "IsAlwaysPremium"
}

player_flags_calc = {}

function nextFlag(cid, id, modalid)
local firstWindow = ModalWindow(modalid, "Player Flag Calculator", player_flags[id])
   firstWindow:addButton(1, "true")
   firstWindow:addButton(2, "false")
   firstWindow:addButton(3, "stop")
   firstWindow:setDefaultEnterButton(1)
   firstWindow:setDefaultEscapeButton(3)
   firstWindow:sendToPlayer(cid)
return true
end

function onSay(cid, words, param)
   if Player(cid):getAccountType() >= ACCOUNT_TYPE_GOD then
     player_flags_calc[cid] = 0
     nextFlag(cid, 0, 9000)
   end
return false
end