local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

keywordHandler:addKeyword({'konoha'}, StdModule.travel, {
    npcHandler = npcHandler,
    destination = Position(1438, 1002, 7)
})

keywordHandler:addKeyword({'suna'}, StdModule.travel, {
    npcHandler = npcHandler,
    destination = Position(1186, 1227, 7)
})

npcHandler:addModule(FocusModule:new())
