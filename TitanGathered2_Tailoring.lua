TITAN_TAILORING_ID = "Tailoring"
tgtPluginDb = {}

TitanGathered2_Tailoring = {}
-- Reduce the chance of functions and variables colliding with another addon.
local tgc = TitanGathered2_Tailoring
local infoBoardData = {}
local tg = TitanGathered2

tgt.id = TITAN_TAILORING_ID
tgt.addon = "TitanGathered2_Tailoring"
tgt.email = "bajtlamer@gmail.com"
tgt.www = "www.rrsoft.cz"

--  Get data from the TOC file.
tgt.version = tostring(GetAddOnMetadata(tgt.addon, "Version")) or "Unknown"
tgt.author = tostring(GetAddOnMetadata(tgt.addon, "Author")) or "Unknown"


for _, _category in pairs(TGt_PLUGIN_CATEGORIES) do
    table.insert(TG_CATEGORIES, _category)
end


function tgt.Button_OnLoad(self)
	echo(tgt.addon.." ("..TitanUtils_GetGreenText(tgt.version).."|cffff8020) loaded! Created By "..tgt.author)
    tgt.registerPlugin()
    tgt.registerPluginMinable()
end


function tgt.registerPlugin()
    table.insert(tgPlugins, tgtc)
end


function tgt.registerPluginMinable()
    for _, _m in pairs(TGT_MINABLES)do
        table.insert(TG_MINABLES, _m)
    end
end

-- Event
function tgt.Button_OnEvent(self, event)
    -- EMPTY
end


function tgt.getGatherableSourceObject(objectId)
    for _, _m in pairs(TGT_MINABLES) do
        if (_m.id == objectId) then
            return _m
        end
    end
    return {id = objectId, name = nil}
end
