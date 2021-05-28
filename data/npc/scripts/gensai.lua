local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local topic = 0

function greetCallback(cid)
    local player = Player(cid)
    if player:getStorageValue(909090) < 1 then
        if player:getStorageValue(909091) < 1 then
            npcHandler:setMessage(MESSAGE_GREET, "Osu! |PLAYERNAME|, i have a task for you. Will you {help} me?")
            topic = 1
        else
            npcHandler:setMessage(MESSAGE_GREET, "I don't need help.")
        end
    else
        npcHandler:setMessage(MESSAGE_GREET, "Osu! |PLAYERNAME|, did you bring my sword back?")
        topic = 2
    end
    return true
end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

    local player = Player(cid)
    if topic == 1 then
        if msg == 'help' then
            selfSay("I have lost my sword during a mission to the east. The place is known for having a bunch of mountain thiefs. Can you bring it back to me? {yes} or {no}", cid)
            topic = 3
        else
            selfSay("Sorry, i didn't understand.", cid)
        end
    elseif topic == 2 then
        if msg == 'yes' then
            if player:getStorageValue(909090) == 1 and player:getStorageValue(909091) == 1 then
                selfSay("Thank you! Take this reward. I wish the best for your adventures.", cid)
                player:getPosition():sendMagicEffect(300)
                player:addItem(14163, 1)
                player:setStorageValue(909090, 0)
                npcHandler:releaseFocus(cid)
            else
                selfSay("You didn't bring me back my sword.", cid)
                npcHandler:releaseFocus(cid)
            end
        elseif msg == 'no' then
            selfSay('Go and bring that sword back to me.', cid)
            npcHandler:releaseFocus(cid)
        else
            selfSay("Sorry, i didn't understand.", cid)
        end
    elseif topic == 3 then
        if msg == 'yes' then
            player:setStorageValue(909090, 1)
            selfSay('Good luck warrior!', cid)
        elseif msg == 'no' then
            selfSay('Get out of here, Punk.', cid)
            npcHandler:releaseFocus(cid)
        else
            selfSay("Sorry, i didn't understand.", cid)
        end
    end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
