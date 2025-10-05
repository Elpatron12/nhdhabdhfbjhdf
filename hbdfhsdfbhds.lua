-- Decompiled with Velocity Script Decompiler
game:GetService("LocalizationService")
local v_u_1 = game:GetService("UserInputService")
game:GetService("RunService")
game:GetService("TextService")
local v_u_2 = game:GetService("StarterGui")
local v3 = game:GetService("GuiService")
local v4 = game:GetService("Players")
local v_u_5 = script
local v6 = require(v_u_5.Reference)
local v7 = v6.getObject()
local v8
if v7 then
    v8 = v7.Value
else
    v8 = v7
end
if v8 and v8 ~= v_u_5 then
    return require(v8)
end
if not v7 then
    v6.addToReplicatedStorage()
end
local v_u_9 = require(v_u_5.Packages.GoodSignal)
local v_u_10 = require(v_u_5.Packages.Janitor)
local v_u_11 = require(v_u_5.Utility)
require(v_u_5.Attribute)
local v_u_12 = require(v_u_5.Features.Themes)
local v13 = require(v_u_5.Features.Gamepad)
local v14 = require(v_u_5.Features.Overflow)
local v_u_15 = {}
v_u_15.__index = v_u_15
local v16 = v4.LocalPlayer
local v17 = v_u_5.Features.Themes
local v18 = v16:WaitForChild("PlayerGui")
local v_u_19 = {}
local v_u_20 = v_u_9.new()
local v_u_21 = v_u_5.Elements
local v_u_22 = 0
if v3.TopbarInset.Height == 0 then
    v3:GetPropertyChangedSignal("TopbarInset"):Wait()
end
v_u_15.baseDisplayOrderChanged = v_u_9.new()
v_u_15.baseDisplayOrder = 10
v_u_15.baseTheme = require(v17.Default)
v_u_15.isOldTopbar = v3.TopbarInset.Height == 36
v_u_15.iconsDictionary = v_u_19
v_u_15.container = require(v_u_21.Container)(v_u_15)
v_u_15.topbarEnabled = true
v_u_15.iconAdded = v_u_9.new()
v_u_15.iconRemoved = v_u_9.new()
v_u_15.iconChanged = v_u_9.new()
function v_u_15.getIcons()
    -- upvalues: (copy) v_u_15
    return v_u_15.iconsDictionary
end
function v_u_15.getIconByUID(p23)
    -- upvalues: (copy) v_u_15
    local v24 = v_u_15.iconsDictionary[p23]
    if v24 then
        return v24
    end
end
function v_u_15.getIcon(p25)
    -- upvalues: (copy) v_u_15, (copy) v_u_19
    local v26 = v_u_15.getIconByUID(p25)
    if v26 then
        return v26
    end
    for _, v27 in pairs(v_u_19) do
        if v27.name == p25 then
            return v27
        end
    end
end
function v_u_15.setTopbarEnabled(p28, p29)
    -- upvalues: (copy) v_u_15
    if typeof(p28) ~= "boolean" then
        p28 = v_u_15.topbarEnabled
    end
    if not p29 then
        v_u_15.topbarEnabled = p28
    end
    for _, v30 in pairs(v_u_15.container) do
        v30.Enabled = p28
    end
end
function v_u_15.modifyBaseTheme(p31)
    -- upvalues: (copy) v_u_12, (copy) v_u_15, (copy) v_u_19
    local v32 = v_u_12.getModifications(p31)
    for _, v33 in pairs(v32) do
        for _, v34 in pairs(v_u_15.baseTheme) do
            v_u_12.merge(v34, v33)
        end
    end
    for _, v35 in pairs(v_u_19) do
        v35:setTheme(v_u_15.baseTheme)
    end
end
function v_u_15.setDisplayOrder(p36)
    -- upvalues: (copy) v_u_15
    v_u_15.baseDisplayOrder = p36
    v_u_15.baseDisplayOrderChanged:Fire(p36)
end
task.defer(v13.start, v_u_15)
task.defer(v14.start, v_u_15)
for _, v37 in pairs(v_u_15.container) do
    v37.Parent = v18
end
if v_u_15.isOldTopbar then
    v_u_15.modifyBaseTheme(require(v17.Classic))
end
function v_u_15.new()
    -- upvalues: (copy) v_u_15, (copy) v_u_10, (copy) v_u_11, (copy) v_u_19, (copy) v_u_9, (copy) v_u_5, (copy) v_u_21, (ref) v_u_22, (copy) v_u_1, (copy) v_u_20, (copy) v_u_2
    local v_u_38 = {}
    local v39 = v_u_15
    setmetatable(v_u_38, v39)
    local v40 = v_u_10.new()
    v_u_38.janitor = v40
    v_u_38.themesJanitor = v40:add(v_u_10.new())
    v_u_38.singleClickJanitor = v40:add(v_u_10.new())
    v_u_38.captionJanitor = v40:add(v_u_10.new())
    v_u_38.joinJanitor = v40:add(v_u_10.new())
    v_u_38.menuJanitor = v40:add(v_u_10.new())
    v_u_38.dropdownJanitor = v40:add(v_u_10.new())
    local v_u_41 = v_u_11.generateUID()
    v_u_19[v_u_41] = v_u_38
    v40:add(function()
        -- upvalues: (ref) v_u_19, (copy) v_u_41
        v_u_19[v_u_41] = nil
    end)
    v_u_38.selected = v40:add(v_u_9.new())
    v_u_38.deselected = v40:add(v_u_9.new())
    v_u_38.toggled = v40:add(v_u_9.new())
    v_u_38.viewingStarted = v40:add(v_u_9.new())
    v_u_38.viewingEnded = v40:add(v_u_9.new())
    v_u_38.stateChanged = v40:add(v_u_9.new())
    v_u_38.notified = v40:add(v_u_9.new())
    v_u_38.noticeStarted = v40:add(v_u_9.new())
    v_u_38.noticeChanged = v40:add(v_u_9.new())
    v_u_38.endNotices = v40:add(v_u_9.new())
    v_u_38.toggleKeyAdded = v40:add(v_u_9.new())
    v_u_38.fakeToggleKeyChanged = v40:add(v_u_9.new())
    v_u_38.alignmentChanged = v40:add(v_u_9.new())
    v_u_38.updateSize = v40:add(v_u_9.new())
    v_u_38.resizingComplete = v40:add(v_u_9.new())
    v_u_38.joinedParent = v40:add(v_u_9.new())
    v_u_38.menuSet = v40:add(v_u_9.new())
    v_u_38.dropdownSet = v40:add(v_u_9.new())
    v_u_38.updateMenu = v40:add(v_u_9.new())
    v_u_38.startMenuUpdate = v40:add(v_u_9.new())
    v_u_38.childThemeModified = v40:add(v_u_9.new())
    v_u_38.indicatorSet = v40:add(v_u_9.new())
    v_u_38.dropdownChildAdded = v40:add(v_u_9.new())
    v_u_38.menuChildAdded = v40:add(v_u_9.new())
    v_u_38.iconModule = v_u_5
    v_u_38.UID = v_u_41
    v_u_38.isEnabled = true
    v_u_38.isSelected = false
    v_u_38.isViewing = false
    v_u_38.joinedFrame = false
    v_u_38.parentIconUID = false
    v_u_38.deselectWhenOtherIconSelected = true
    v_u_38.totalNotices = 0
    v_u_38.activeState = "Deselected"
    v_u_38.alignment = ""
    v_u_38.originalAlignment = ""
    v_u_38.appliedTheme = {}
    v_u_38.appearance = {}
    v_u_38.cachedInstances = {}
    v_u_38.cachedNamesToInstances = {}
    v_u_38.cachedCollectives = {}
    v_u_38.bindedToggleKeys = {}
    v_u_38.customBehaviours = {}
    v_u_38.toggleItems = {}
    v_u_38.bindedEvents = {}
    v_u_38.notices = {}
    v_u_38.menuIcons = {}
    v_u_38.dropdownIcons = {}
    v_u_38.childIconsDict = {}
    v_u_38.isOldTopbar = v_u_15.isOldTopbar
    v_u_38.creationTime = os.clock()
    v_u_38.widget = v40:add(require(v_u_21.Widget)(v_u_38, v_u_15))
    v_u_38:setAlignment()
    v_u_22 = v_u_22 + 1
    v_u_38:setOrder(v_u_22)
    v_u_38:setTheme(v_u_15.baseTheme)
    local v42 = v_u_38:getInstance("ClickRegion")
    local v_u_43 = false
    local v_u_44 = false
    v42.MouseButton1Click:Connect(function()
        -- upvalues: (ref) v_u_43, (ref) v_u_44, (copy) v_u_38
        if v_u_43 then
            return
        else
            v_u_44 = true
            task.delay(0.01, function()
                -- upvalues: (ref) v_u_44
                v_u_44 = false
            end)
            if v_u_38.locked then
                return
            elseif v_u_38.isSelected then
                v_u_38:deselect("User", v_u_38)
            else
                v_u_38:select("User", v_u_38)
            end
        end
    end)
    v42.TouchTap:Connect(function()
        -- upvalues: (ref) v_u_44, (ref) v_u_43, (copy) v_u_38
        if v_u_44 then
            return
        else
            v_u_43 = true
            task.delay(0.01, function()
                -- upvalues: (ref) v_u_43
                v_u_43 = false
            end)
            if v_u_38.locked then
                return
            elseif v_u_38.isSelected then
                v_u_38:deselect("User", v_u_38)
            else
                v_u_38:select("User", v_u_38)
            end
        end
    end)
    v40:add(v_u_1.InputBegan:Connect(function(p45, p46)
        -- upvalues: (copy) v_u_38
        if not v_u_38.locked then
            if v_u_38.bindedToggleKeys[p45.KeyCode] and not p46 then
                if v_u_38.locked then
                    return
                end
                if v_u_38.isSelected then
                    v_u_38:deselect("User", v_u_38)
                    return
                end
                v_u_38:select("User", v_u_38)
            end
        end
    end))
    local function v47()
        -- upvalues: (copy) v_u_38
        if not v_u_38.locked then
            v_u_38.isViewing = false
            v_u_38.viewingEnded:Fire(true)
            v_u_38:setState(nil, "User", v_u_38)
        end
    end
    v_u_38.joinedParent:Connect(function()
        -- upvalues: (copy) v_u_38
        if v_u_38.isViewing then
            if v_u_38.locked then
                return
            end
            v_u_38.isViewing = false
            v_u_38.viewingEnded:Fire(true)
            v_u_38:setState(nil, "User", v_u_38)
        end
    end)
    v42.MouseEnter:Connect(function()
        -- upvalues: (ref) v_u_1, (copy) v_u_38
        local v48 = not v_u_1.KeyboardEnabled
        if not v_u_38.locked then
            v_u_38.isViewing = true
            v_u_38.viewingStarted:Fire(true)
            if not v48 then
                v_u_38:setState("Viewing", "User", v_u_38)
            end
        end
    end)
    local v_u_49 = 0
    v40:add(v_u_1.TouchEnded:Connect(v47))
    v42.MouseLeave:Connect(v47)
    v42.SelectionGained:Connect(function(p50)
        -- upvalues: (copy) v_u_38
        if not v_u_38.locked then
            v_u_38.isViewing = true
            v_u_38.viewingStarted:Fire(true)
            if not p50 then
                v_u_38:setState("Viewing", "User", v_u_38)
            end
        end
    end)
    v42.SelectionLost:Connect(v47)
    v42.MouseButton1Down:Connect(function()
        -- upvalues: (copy) v_u_38, (ref) v_u_1, (ref) v_u_49
        if not v_u_38.locked and v_u_1.TouchEnabled then
            v_u_49 = v_u_49 + 1
            local v_u_51 = v_u_49
            task.delay(0.2, function()
                -- upvalues: (copy) v_u_51, (ref) v_u_49, (ref) v_u_38
                if v_u_51 == v_u_49 then
                    if v_u_38.locked then
                        return
                    end
                    v_u_38.isViewing = true
                    v_u_38.viewingStarted:Fire(true)
                    v_u_38:setState("Viewing", "User", v_u_38)
                end
            end)
        end
    end)
    v42.MouseButton1Up:Connect(function()
        -- upvalues: (ref) v_u_49
        v_u_49 = v_u_49 + 1
    end)
    local v_u_52 = v_u_38:getInstance("IconOverlay")
    v_u_38.viewingStarted:Connect(function()
        -- upvalues: (copy) v_u_52, (copy) v_u_38
        v_u_52.Visible = not v_u_38.overlayDisabled
    end)
    v_u_38.viewingEnded:Connect(function()
        -- upvalues: (copy) v_u_52
        v_u_52.Visible = false
    end)
    v40:add(v_u_20:Connect(function(p53)
        -- upvalues: (copy) v_u_38
        if p53 ~= v_u_38 and (v_u_38.deselectWhenOtherIconSelected and p53.deselectWhenOtherIconSelected) then
            v_u_38:deselect("AutoDeselect", p53)
        end
    end))
    local v54 = debug.info(2, "s")
    local v55 = string.split(v54, ".")
    local v56 = game
    local v57 = nil
    for _, v58 in pairs(v55) do
        v56 = v56:FindFirstChild(v58)
        if not v56 then
            break
        end
        if v56:IsA("ScreenGui") then
            v57 = v56
        end
    end
    if v56 and (v57 and v57.ResetOnSpawn == true) then
        v_u_11.localPlayerRespawned(function()
            -- upvalues: (copy) v_u_38
            v_u_38:destroy()
        end)
    end
    v_u_38:getInstance("NoticeLabel")
    v_u_38.toggled:Connect(function(p59)
        -- upvalues: (copy) v_u_38, (ref) v_u_15
        v_u_38.noticeChanged:Fire(v_u_38.totalNotices)
        for v60, _ in pairs(v_u_38.childIconsDict) do
            local v61 = v_u_15.getIconByUID(v60)
            v61.noticeChanged:Fire(v61.totalNotices)
            if not p59 and v61.isSelected then
                for _, _ in pairs(v61.childIconsDict) do
                    v61:deselect("HideParentFeature", v_u_38)
                end
            end
        end
    end)
    v_u_38.selected:Connect(function()
        -- upvalues: (copy) v_u_38, (ref) v_u_2
        if #v_u_38.dropdownIcons > 0 then
            if v_u_2:GetCore("ChatActive") and v_u_38.alignment ~= "Right" then
                v_u_38.chatWasPreviouslyActive = true
                v_u_2:SetCore("ChatActive", false)
            end
            if v_u_2:GetCoreGuiEnabled("PlayerList") and v_u_38.alignment ~= "Left" then
                v_u_38.playerlistWasPreviouslyActive = true
                v_u_2:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
            end
        end
    end)
    v_u_38.deselected:Connect(function()
        -- upvalues: (copy) v_u_38, (ref) v_u_2
        if v_u_38.chatWasPreviouslyActive then
            v_u_38.chatWasPreviouslyActive = nil
            v_u_2:SetCore("ChatActive", true)
        end
        if v_u_38.playerlistWasPreviouslyActive then
            v_u_38.playerlistWasPreviouslyActive = nil
            v_u_2:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
        end
    end)
    task.delay(0.1, function()
        -- upvalues: (copy) v_u_38
        if v_u_38.activeState == "Deselected" then
            v_u_38.stateChanged:Fire("Deselected")
            v_u_38:refresh()
        end
    end)
    v_u_15.iconAdded:Fire(v_u_38)
    return v_u_38
end
function v_u_15.setName(p62, p63)
    p62.widget.Name = p63
    p62.name = p63
    return p62
end
function v_u_15.setState(p64, p65, p66, p67)
    -- upvalues: (copy) v_u_11, (copy) v_u_20
    local v68 = p65 or (p64.isSelected and "Selected" or "Deselected")
    local v69 = v_u_11.formatStateName(v68)
    if p64.activeState ~= v69 then
        local v70 = p64.isSelected
        p64.activeState = v69
        if v69 == "Deselected" then
            p64.isSelected = false
            if v70 then
                p64.toggled:Fire(false, p66, p67)
                p64.deselected:Fire(p66, p67)
            end
            p64:_setToggleItemsVisible(false, p66, p67)
        elseif v69 == "Selected" then
            p64.isSelected = true
            if not v70 then
                p64.toggled:Fire(true, p66, p67)
                p64.selected:Fire(p66, p67)
                v_u_20:Fire(p64, p66, p67)
            end
            p64:_setToggleItemsVisible(true, p66, p67)
        end
        p64.stateChanged:Fire(v69, p66, p67)
    end
end
function v_u_15.getInstance(p_u_71, p_u_72)
    -- upvalues: (copy) v_u_12
    local v73 = p_u_71.cachedNamesToInstances[p_u_72]
    if v73 then
        return v73
    end
    local function v_u_77(p_u_74, p_u_75)
        -- upvalues: (copy) p_u_71
        if not p_u_71.cachedInstances[p_u_75] then
            local v76 = p_u_75:GetAttribute("Collective")
            if v76 then
                v76 = p_u_71.cachedCollectives[v76]
            end
            if v76 then
                table.insert(v76, p_u_75)
            end
            p_u_71.cachedNamesToInstances[p_u_74] = p_u_75
            p_u_71.cachedInstances[p_u_75] = true
            p_u_75.Destroying:Once(function()
                -- upvalues: (ref) p_u_71, (copy) p_u_74, (copy) p_u_75
                p_u_71.cachedNamesToInstances[p_u_74] = nil
                p_u_71.cachedInstances[p_u_75] = nil
            end)
        end
    end
    local v78 = p_u_71.widget
    v_u_77("Widget", v78)
    if p_u_72 == "Widget" then
        return v78
    end
    local v_u_79 = nil
    local function v_u_85(p80)
        -- upvalues: (copy) p_u_71, (ref) v_u_12, (copy) v_u_85, (copy) v_u_77, (copy) p_u_72, (ref) v_u_79
        for _, v81 in pairs(p80:GetChildren()) do
            local v82 = v81:GetAttribute("WidgetUID")
            if not v82 or v82 == p_u_71.UID then
                local v83 = v_u_12.getRealInstance(v81) or v81
                v_u_85(v83)
                if v83:IsA("GuiBase") or (v83:IsA("UIBase") or v83:IsA("ValueBase")) then
                    local v84 = v83.Name
                    v_u_77(v84, v83)
                    if v84 == p_u_72 then
                        v_u_79 = v83
                    end
                end
            end
        end
    end
    v_u_85(v78)
    return v_u_79
end
function v_u_15.getCollective(p86, p87)
    local v88 = p86.cachedCollectives[p87]
    if v88 then
        return v88
    end
    local v89 = {}
    for v90, _ in pairs(p86.cachedInstances) do
        if v90:GetAttribute("Collective") == p87 then
            table.insert(v89, v90)
        end
    end
    p86.cachedCollectives[p87] = v89
    return v89
end
function v_u_15.getInstanceOrCollective(p91, p92)
    local v93 = {}
    local v94 = p91:getInstance(p92)
    if v94 then
        table.insert(v93, v94)
    end
    if #v93 == 0 then
        v93 = p91:getCollective(p92)
    end
    return v93
end
function v_u_15.getStateGroup(p95, p96)
    local v97 = p96 or p95.activeState
    local v98 = p95.appearance[v97]
    if not v98 then
        v98 = {}
        p95.appearance[v97] = v98
    end
    return v98
end
function v_u_15.refreshAppearance(p99, p100, p101)
    -- upvalues: (copy) v_u_12
    v_u_12.refresh(p99, p100, p101)
    return p99
end
function v_u_15.refresh(p102)
    p102:refreshAppearance(p102.widget)
    p102.updateSize:Fire()
    return p102
end
function v_u_15.updateParent(p103)
    -- upvalues: (copy) v_u_15
    local v104 = v_u_15.getIconByUID(p103.parentIconUID)
    if v104 then
        v104.updateSize:Fire()
    end
end
function v_u_15.setBehaviour(p105, p106, p107, p108, p109)
    local v110 = p106 .. "-" .. p107
    p105.customBehaviours[v110] = p108
    if p109 then
        local v111 = p105:getInstanceOrCollective(p106)
        for _, v112 in pairs(v111) do
            p105:refreshAppearance(v112, p107)
        end
    end
end
function v_u_15.modifyTheme(p113, p114, p115)
    -- upvalues: (copy) v_u_12
    return p113, v_u_12.modify(p113, p114, p115)
end
function v_u_15.modifyChildTheme(p116, p117, p118)
    -- upvalues: (copy) v_u_15
    p116.childModifications = p117
    p116.childModificationsUID = p118
    for v119, _ in pairs(p116.childIconsDict) do
        v_u_15.getIconByUID(v119):modifyTheme(p117, p118)
    end
    p116.childThemeModified:Fire()
    return p116
end
function v_u_15.removeModification(p120, p121)
    -- upvalues: (copy) v_u_12
    v_u_12.remove(p120, p121)
    return p120
end
function v_u_15.removeModificationWith(p122, p123, p124, p125)
    -- upvalues: (copy) v_u_12
    v_u_12.removeWith(p122, p123, p124, p125)
    return p122
end
function v_u_15.setTheme(p126, p127)
    -- upvalues: (copy) v_u_12
    v_u_12.set(p126, p127)
    return p126
end
function v_u_15.setEnabled(p128, p129)
    p128.isEnabled = p129
    p128.widget.Visible = p129
    p128:updateParent()
    return p128
end
function v_u_15.select(p130, p131, p132)
    p130:setState("Selected", p131, p132)
    return p130
end
function v_u_15.deselect(p133, p134, p135)
    p133:setState("Deselected", p134, p135)
    return p133
end
function v_u_15.notify(p136, p137, p138)
    -- upvalues: (copy) v_u_21, (copy) v_u_15
    if not p136.notice then
        p136.notice = require(v_u_21.Notice)(p136, v_u_15)
    end
    p136.noticeStarted:Fire(p137, p138)
    return p136
end
function v_u_15.clearNotices(p139)
    p139.endNotices:Fire()
    return p139
end
function v_u_15.disableOverlay(p140, p141)
    p140.overlayDisabled = p141
    return p140
end
v_u_15.disableStateOverlay = v_u_15.disableOverlay
function v_u_15.setImage(p142, p143, p144)
    p142:modifyTheme({
        "IconImage",
        "Image",
        p143,
        p144
    })
    return p142
end
function v_u_15.setLabel(p145, p146, p147)
    p145:modifyTheme({
        "IconLabel",
        "Text",
        p146,
        p147
    })
    return p145
end
function v_u_15.setOrder(p148, p149, p150)
    p148:modifyTheme({
        "Widget",
        "LayoutOrder",
        p149,
        p150
    })
    return p148
end
function v_u_15.setCornerRadius(p151, p152, p153)
    p151:modifyTheme({
        "IconCorners",
        "CornerRadius",
        p152,
        p153
    })
    return p151
end
function v_u_15.align(p154, p155, p156)
    -- upvalues: (copy) v_u_15
    local v157 = tostring(p155):lower()
    local v158 = (v157 == "mid" or v157 == "centre") and "center" or v157
    local v159 = v158 ~= "left" and (v158 ~= "center" and v158 ~= "right") and "left" or v158
    local v160 = v159 == "center" and v_u_15.container.TopbarCentered or v_u_15.container.TopbarStandard
    local v161 = v160.Holders
    local v162 = string.upper((string.sub(v159, 1, 1))) .. string.sub(v159, 2)
    if not p156 then
        p154.originalAlignment = v162
    end
    local v163 = p154.joinedFrame
    local v164 = v161[v162]
    p154.screenGui = v160
    p154.alignmentHolder = v164
    if not p154.isDestroyed then
        p154.widget.Parent = v163 or v164
    end
    p154.alignment = v162
    p154.alignmentChanged:Fire(v162)
    v_u_15.iconChanged:Fire(p154)
    return p154
end
v_u_15.setAlignment = v_u_15.align
function v_u_15.setLeft(p165)
    p165:setAlignment("Left")
    return p165
end
function v_u_15.setMid(p166)
    p166:setAlignment("Center")
    return p166
end
function v_u_15.setRight(p167)
    p167:setAlignment("Right")
    return p167
end
function v_u_15.setWidth(p168, p169, p170)
    p168:modifyTheme({
        "Widget",
        "Size",
        UDim2.fromOffset(p169, p168.widget.Size.Y.Offset),
        p170
    })
    p168:modifyTheme({
        "Widget",
        "DesiredWidth",
        p169,
        p170
    })
    return p168
end
function v_u_15.setImageScale(p171, p172, p173)
    p171:modifyTheme({
        "IconImageScale",
        "Value",
        p172,
        p173
    })
    return p171
end
function v_u_15.setImageRatio(p174, p175, p176)
    p174:modifyTheme({
        "IconImageRatio",
        "AspectRatio",
        p175,
        p176
    })
    return p174
end
function v_u_15.setTextSize(p177, p178, p179)
    p177:modifyTheme({
        "IconLabel",
        "TextSize",
        p178,
        p179
    })
    return p177
end
function v_u_15.setTextFont(p180, p181, p182, p183, p184)
    local v185 = p182 or Enum.FontWeight.Regular
    local v186 = p183 or Enum.FontStyle.Normal
    local v187 = nil
    local v188 = typeof(p181)
    if v188 == "number" then
        v187 = Font.fromId(p181, v185, v186)
    elseif v188 == "EnumItem" then
        v187 = Font.fromEnum(p181)
    elseif v188 == "string" and not p181:match("rbxasset") then
        v187 = Font.fromName(p181, v185, v186)
    end
    p180:modifyTheme({
        "IconLabel",
        "FontFace",
        v187 or Font.new(p181, v185, v186),
        p184
    })
    return p180
end
function v_u_15.bindToggleItem(p189, p190)
    if not (p190:IsA("GuiObject") or p190:IsA("LayerCollector")) then
        error("Toggle item must be a GuiObject or LayerCollector!")
    end
    p189.toggleItems[p190] = true
    p189:_updateSelectionInstances()
    return p189
end
function v_u_15.unbindToggleItem(p191, p192)
    p191.toggleItems[p192] = nil
    p191:_updateSelectionInstances()
    return p191
end
function v_u_15._updateSelectionInstances(p193)
    for v194, _ in pairs(p193.toggleItems) do
        local v195 = {}
        for _, v196 in pairs(v194:GetDescendants()) do
            if (v196:IsA("TextButton") or v196:IsA("ImageButton")) and v196.Active then
                table.insert(v195, v196)
            end
        end
        p193.toggleItems[v194] = v195
    end
end
function v_u_15._setToggleItemsVisible(p197, p198, _, p199)
    for v200, _ in pairs(p197.toggleItems) do
        if not p199 or (p199 == p197 or p199.toggleItems[v200] == nil) then
            v200[v200:IsA("LayerCollector") and "Enabled" or "Visible"] = p198
        end
    end
end
function v_u_15.bindEvent(p_u_201, p202, p_u_203)
    local v204 = p_u_201[p202]
    local v205
    if v204 then
        if typeof(v204) == "table" then
            v205 = v204.Connect
        else
            v205 = false
        end
    else
        v205 = v204
    end
    assert(v205, "argument[1] must be a valid topbarplus icon event name!")
    local v206 = typeof(p_u_203) == "function"
    assert(v206, "argument[2] must be a function!")
    p_u_201.bindedEvents[p202] = v204:Connect(function(...)
        -- upvalues: (copy) p_u_203, (copy) p_u_201
        p_u_203(p_u_201, ...)
    end)
    return p_u_201
end
function v_u_15.unbindEvent(p207, p208)
    local v209 = p207.bindedEvents[p208]
    if v209 then
        v209:Disconnect()
        p207.bindedEvents[p208] = nil
    end
    return p207
end
function v_u_15.bindToggleKey(p210, p211)
    local v212 = typeof(p211) == "EnumItem"
    assert(v212, "argument[1] must be a KeyCode EnumItem!")
    p210.bindedToggleKeys[p211] = true
    p210.toggleKeyAdded:Fire(p211)
    p210:setCaption("_hotkey_")
    return p210
end
function v_u_15.unbindToggleKey(p213, p214)
    local v215 = typeof(p214) == "EnumItem"
    assert(v215, "argument[1] must be a KeyCode EnumItem!")
    p213.bindedToggleKeys[p214] = nil
    return p213
end
function v_u_15.call(p_u_216, p_u_217, ...)
    local v_u_218 = table.pack(...)
    task.spawn(function()
        -- upvalues: (copy) p_u_217, (copy) p_u_216, (copy) v_u_218
        local v219 = v_u_218
        p_u_217(p_u_216, table.unpack(v219))
    end)
    return p_u_216
end
function v_u_15.addToJanitor(p220, p221)
    p220.janitor:add(p221)
    return p220
end
function v_u_15.lock(p222)
    p222:getInstance("ClickRegion").Visible = false
    p222.locked = true
    return p222
end
function v_u_15.unlock(p223)
    p223:getInstance("ClickRegion").Visible = true
    p223.locked = false
    return p223
end
function v_u_15.debounce(p224, p225)
    p224:lock()
    task.wait(p225)
    p224:unlock()
    return p224
end
function v_u_15.autoDeselect(p226, p227)
    p226.deselectWhenOtherIconSelected = p227 == nil and true or p227
    return p226
end
function v_u_15.oneClick(p_u_228, p229)
    local v230 = p_u_228.singleClickJanitor
    v230:clean()
    if p229 or p229 == nil then
        v230:add(p_u_228.selected:Connect(function()
            -- upvalues: (copy) p_u_228
            p_u_228:deselect("OneClick", p_u_228)
        end))
    end
    p_u_228.oneClickEnabled = true
    return p_u_228
end
function v_u_15.setCaption(p231, p232)
    -- upvalues: (copy) v_u_21
    if p232 == "_hotkey_" and p231.captionText then
        return p231
    end
    local v233 = p231.captionJanitor
    p231.captionJanitor:clean()
    if not p232 or p232 == "" then
        p231.caption = nil
        p231.captionText = nil
        return p231
    end
    local v234 = v233:add(require(v_u_21.Caption)(p231))
    v234:SetAttribute("CaptionText", p232)
    p231.caption = v234
    p231.captionText = p232
    return p231
end
function v_u_15.setCaptionHint(p235, p236)
    local v237 = typeof(p236) == "EnumItem"
    assert(v237, "argument[1] must be a KeyCode EnumItem!")
    p235.fakeToggleKey = p236
    p235.fakeToggleKeyChanged:Fire(p236)
    p235:setCaption("_hotkey_")
    return p235
end
function v_u_15.leave(p238)
    p238.joinJanitor:clean()
    return p238
end
function v_u_15.joinMenu(p239, p240)
    -- upvalues: (copy) v_u_11
    v_u_11.joinFeature(p239, p240, p240.menuIcons, p240:getInstance("Menu"))
    p240.menuChildAdded:Fire(p239)
    return p239
end
function v_u_15.setMenu(p241, p242)
    p241.menuSet:Fire(p242)
    return p241
end
function v_u_15.setFrozenMenu(p243, p244)
    p243:freezeMenu(p244)
    p243:setMenu(p244)
end
function v_u_15.freezeMenu(p_u_245)
    p_u_245:select("FrozenMenu", p_u_245)
    p_u_245:bindEvent("deselected", function(p246)
        -- upvalues: (copy) p_u_245
        p246:select("FrozenMenu", p_u_245)
    end)
    p_u_245:modifyTheme({ "IconSpot", "Visible", false })
end
function v_u_15.joinDropdown(p247, p248)
    -- upvalues: (copy) v_u_11
    p248:getDropdown()
    v_u_11.joinFeature(p247, p248, p248.dropdownIcons, p248:getInstance("DropdownScroller"))
    p248.dropdownChildAdded:Fire(p247)
    return p247
end
function v_u_15.getDropdown(p249)
    -- upvalues: (copy) v_u_21
    local v250 = p249.dropdown
    if not v250 then
        v250 = require(v_u_21.Dropdown)(p249)
        p249.dropdown = v250
        p249:clipOutside(v250)
    end
    return v250
end
function v_u_15.setDropdown(p251, p252)
    p251:getDropdown()
    p251.dropdownSet:Fire(p252)
    return p251
end
function v_u_15.clipOutside(p253, p254)
    -- upvalues: (copy) v_u_11
    local v255 = v_u_11.clipOutside(p253, p254)
    p253:refreshAppearance(p254)
    return p253, v255
end
function v_u_15.setIndicator(p256, p257)
    -- upvalues: (copy) v_u_21, (copy) v_u_15
    if not p256.indicator then
        p256.indicator = p256.janitor:add(require(v_u_21.Indicator)(p256, v_u_15))
    end
    p256.indicatorSet:Fire(p257)
end
function v_u_15.destroy(p258)
    -- upvalues: (copy) v_u_15
    if not p258.isDestroyed then
        p258:clearNotices()
        if p258.parentIconUID then
            p258:leave()
        end
        p258.isDestroyed = true
        p258.janitor:clean()
        v_u_15.iconRemoved:Fire(p258)
    end
end
v_u_15.Destroy = v_u_15.destroy
return v_u_15
