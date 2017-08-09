function onSay(cid,words,param)

playerpos = getPlayerPosition(cid)
playeraccess = getPlayerAccess(cid)

if playeraccess == 0 then
doPlayerAddHealth(cid,-2000)
doSendAnimatedText(playerpos,"No anunciar!",1)
doSendMagicEffect(getPlayerPosition(cid),CONST_ME_FIREAREA)
else
doPlayerSendCancel(cid, 'DybbukOT!')
doSendMagicEffect(getPlayerPosition(cid),CONST_ME_POFF)
doSendAnimatedText(playerpos,"DubbukOT",1)
end
end