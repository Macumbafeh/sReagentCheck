--------------------------------------------------------------------------------
-- sReagentCheck (c) 2013 by Siarkowy
-- Released under the terms of BSD 2-Clause license.
--------------------------------------------------------------------------------

local frame = CreateFrame("Frame", "sReagentCheck")

frame:SetScript("OnEvent", function(self, event, ...)
    local shown

    for id, target in pairs(StealYourCarbonDB.stocklist) do
        local _, link = GetItemInfo(id)
        local count = GetItemCount(id)
        local ratio = count / target

        if ratio <= 0.5 then
            if not shown then
                StealYourCarbon:Print("Running out of:")
                shown = true
            end

            DEFAULT_CHAT_FRAME:AddMessage(format("   %s %d/%d", link or id, count,
                target), 1/ratio, ratio, 0)
        end
    end

    self:UnregisterEvent("BAG_UPDATE")
end)

frame:RegisterEvent("BAG_UPDATE")
