function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	player:setHiddenHealth(not player:isHealthHidden())
	return false
end
