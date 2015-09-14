local e={}local l=Tpp.ApendArray
local n=Tpp.DEBUG_StrCode32ToString
local i=Tpp.IsTypeFunc
local t=Tpp.IsTypeTable
local f=TppScriptVars.IsSavingOrLoading
local m=ScriptBlock.UpdateScriptsInScriptBlocks
local M=Mission.GetCurrentMessageResendCount
local o={}local p=0
local T={}local a=0
local d={}local u=0
local n={}local n=0
local S={}local P={}local s=0
local c={}local h={}local r=0
local function n()if QuarkSystem.GetCompilerState()==QuarkSystem.COMPILER_STATE_WAITING_TO_LOAD then
QuarkSystem.PostRequestToLoad()coroutine.yield()while QuarkSystem.GetCompilerState()==QuarkSystem.COMPILER_STATE_WAITING_TO_LOAD do
coroutine.yield()end
end
end
function e.DisableGameStatus()TppMission.DisableInGameFlag()Tpp.SetGameStatus{target="all",enable=false,except={S_DISABLE_NPC=false},scriptName="TppMain.lua"}end
function e.DisableGameStatusOnGameOverMenu()TppMission.DisableInGameFlag()Tpp.SetGameStatus{target="all",enable=false,scriptName="TppMain.lua"}end
function e.EnableGameStatus()TppMission.EnableInGameFlag()Tpp.SetGameStatus{target={S_DISABLE_PLAYER_PAD=true,S_DISABLE_TARGET=true,S_DISABLE_NPC=true,S_DISABLE_NPC_NOTICE=true,S_DISABLE_PLAYER_DAMAGE=true,S_DISABLE_THROWING=true,S_DISABLE_PLACEMENT=true},enable=true,scriptName="TppMain.lua"}end
function e.EnableGameStatusForDemo()TppDemo.ReserveEnableInGameFlag()Tpp.SetGameStatus{target={S_DISABLE_PLAYER_PAD=true,S_DISABLE_TARGET=true,S_DISABLE_NPC=true,S_DISABLE_NPC_NOTICE=true,S_DISABLE_PLAYER_DAMAGE=true,S_DISABLE_THROWING=true,S_DISABLE_PLACEMENT=true},enable=true,scriptName="TppMain.lua"}end
function e.EnableAllGameStatus()TppMission.EnableInGameFlag()Tpp.SetGameStatus{target="all",enable=true,scriptName="TppMain.lua"}end
function e.EnablePlayerPad()TppGameStatus.Reset("TppMain.lua","S_DISABLE_PLAYER_PAD")end
function e.DisablePlayerPad()TppGameStatus.Set("TppMain.lua","S_DISABLE_PLAYER_PAD")end
function e.EnablePause()TppPause.RegisterPause"TppMain.lua"end
function e.DisablePause()TppPause.UnregisterPause"TppMain.lua"end
function e.EnableBlackLoading(e)TppGameStatus.Set("TppMain.lua","S_IS_BLACK_LOADING")if e then
TppUI.StartLoadingTips()end
end
function e.DisableBlackLoading()TppGameStatus.Reset("TppMain.lua","S_IS_BLACK_LOADING")TppUI.FinishLoadingTips()end
function e.OnAllocate(n)TppWeather.OnEndMissionPrepareFunction()e.DisableGameStatus()e.EnablePause()TppClock.Stop()o={}p=0
d={}u=0
TppUI.FadeOut(TppUI.FADE_SPEED.FADE_MOMENT,nil,nil)TppSave.WaitingAllEnqueuedSaveOnStartMission()if TppMission.IsFOBMission(vars.missionCode)then
TppMission.SetFOBMissionFlag()TppGameStatus.Set("Mission","S_IS_ONLINE")else
TppGameStatus.Reset("Mission","S_IS_ONLINE")end
Mission.Start()TppMission.WaitFinishMissionEndPresentation()TppMission.DisableInGameFlag()TppException.OnAllocate(n)TppClock.OnAllocate(n)TppTrap.OnAllocate(n)TppCheckPoint.OnAllocate(n)TppUI.OnAllocate(n)TppDemo.OnAllocate(n)TppScriptBlock.OnAllocate(n)TppSound.OnAllocate(n)TppPlayer.OnAllocate(n)TppMission.OnAllocate(n)TppTerminal.OnAllocate(n)TppEnemy.OnAllocate(n)TppRadio.OnAllocate(n)TppGimmick.OnAllocate(n)TppMarker.OnAllocate(n)TppRevenge.OnAllocate(n)e.ClearStageBlockMessage()TppQuest.OnAllocate(n)TppAnimal.OnAllocate(n)local function o()if TppLocation.IsAfghan()then
if afgh then
afgh.OnAllocate()end
elseif TppLocation.IsMiddleAfrica()then
if mafr then
mafr.OnAllocate()end
elseif TppLocation.IsCyprus()then
if cypr then
cypr.OnAllocate()end
elseif TppLocation.IsMotherBase()then
if mtbs then
mtbs.OnAllocate()end
end
end
o()if n.sequence then
if i(n.sequence.MissionPrepare)then
n.sequence.MissionPrepare()end
if i(n.sequence.OnEndMissionPrepareSequence)then
TppSequence.SetOnEndMissionPrepareFunction(n.sequence.OnEndMissionPrepareSequence)end
end
for n,e in pairs(n)do
if i(e.OnLoad)then
e.OnLoad()end
end
do
local s={}for t,e in ipairs(Tpp._requireList)do
if _G[e]then
if _G[e].DeclareSVars then
l(s,_G[e].DeclareSVars(n))end
end
end
local o={}for n,e in pairs(n)do
if i(e.DeclareSVars)then
l(o,e.DeclareSVars())end
if t(e.saveVarsList)then
l(o,TppSequence.MakeSVarsTable(e.saveVarsList))end
end
l(s,o)TppScriptVars.DeclareSVars(s)TppScriptVars.SetSVarsNotificationEnabled(false)while f()do
coroutine.yield()end
TppRadioCommand.SetScriptDeclVars()local i=vars.mbLayoutCode
if gvars.ini_isTitleMode then
TppPlayer.MissionStartPlayerTypeSetting()else
if TppMission.IsMissionStart()then
TppVarInit.InitializeForNewMission(n)TppPlayer.MissionStartPlayerTypeSetting()if not TppMission.IsFOBMission(vars.missionCode)then
TppSave.VarSave(vars.missionCode,true)end
else
TppVarInit.InitializeForContinue(n)end
TppVarInit.ClearIsContinueFromTitle()end
TppStory.SetMissionClearedS10030()TppTerminal.StartSyncMbManagementOnMissionStart()if TppLocation.IsMotherBase()then
if i~=vars.mbLayoutCode then
if vars.missionCode==30050 then
vars.mbLayoutCode=i
else
vars.mbLayoutCode=TppLocation.ModifyMbsLayoutCode(TppMotherBaseManagement.GetMbsTopologyType())end
end
end
e.StageBlockCurrentPosition(true)TppMission.SetSortieBuddy()TppStory.UpdateStorySequence{updateTiming="BeforeBuddyBlockLoad"}if n.sequence then
local e=n.sequence.DISABLE_BUDDY_TYPE
if e then
local n
if t(e)then
n=e
else
n={e}end
for n,e in ipairs(n)do
TppBuddyService.SetDisableBuddyType(e)end
end
end
if(vars.missionCode==11043)or(vars.missionCode==11044)then
TppBuddyService.SetDisableAllBuddy()end
if TppGameSequence.GetGameTitleName()=="TPP"then
if n.sequence and n.sequence.OnBuddyBlockLoad then
n.sequence.OnBuddyBlockLoad()end
if TppLocation.IsAfghan()or TppLocation.IsMiddleAfrica()then
TppBuddy2BlockController.Load()end
end
TppSequence.SaveMissionStartSequence()TppScriptVars.SetSVarsNotificationEnabled(true)end
if n.enemy then
if t(n.enemy.soldierPowerSettings)then
TppEnemy.SetUpPowerSettings(n.enemy.soldierPowerSettings)end
end
TppRevenge.DecideRevenge(n)if TppEquip.CreateEquipMissionBlockGroup then
if(vars.missionCode>6e4)then
TppEquip.CreateEquipMissionBlockGroup{size=(380*1024)*24}else
TppPlayer.SetEquipMissionBlockGroupSize()end
end
if TppEquip.CreateEquipGhostBlockGroups then
if TppSystemUtility.GetCurrentGameMode()=="MGO"then
TppEquip.CreateEquipGhostBlockGroups{ghostCount=16}elseif TppMission.IsFOBMission(vars.missionCode)then
TppEquip.CreateEquipGhostBlockGroups{ghostCount=1}end
end
TppEquip.StartLoadingToEquipMissionBlock()TppPlayer.SetMaxPickableLocatorCount()TppPlayer.SetMaxPlacedLocatorCount()TppEquip.AllocInstances{instance=60,realize=60}TppEquip.ActivateEquipSystem()if TppEnemy.IsRequiredToLoadDefaultSoldier2CommonPackage()then
TppEnemy.LoadSoldier2CommonBlock()end
if n.sequence then
mvars.mis_baseList=n.sequence.baseList
TppCheckPoint.RegisterCheckPointList(n.sequence.checkPointList)end
end
function e.OnInitialize(n)if TppMission.IsFOBMission(vars.missionCode)then
TppMission.SetFobPlayerStartPoint()elseif TppMission.IsNeedSetMissionStartPositionToClusterPosition()then
TppMission.SetMissionStartPositionMtbsClusterPosition()e.StageBlockCurrentPosition(true)else
TppCheckPoint.SetCheckPointPosition()end
if TppEnemy.IsRequiredToLoadSpecialSolider2CommonBlock()then
TppEnemy.LoadSoldier2CommonBlock()end
if TppMission.IsMissionStart()then
TppTrap.InitializeVariableTraps()else
TppTrap.RestoreVariableTrapState()end
TppAnimalBlock.InitializeBlockStatus()if TppQuestList then
TppQuest.RegisterQuestList(TppQuestList.questList)TppQuest.RegisterQuestPackList(TppQuestList.questPackList)end
TppHelicopter.AdjustBuddyDropPoint()if n.sequence then
local e=n.sequence.NPC_ENTRY_POINT_SETTING
if t(e)then
TppEnemy.NPCEntryPointSetting(e)end
end
TppLandingZone.OverwriteBuddyVehiclePosForALZ()if n.enemy then
if t(n.enemy.vehicleSettings)then
TppEnemy.SetUpVehicles()end
if i(n.enemy.SpawnVehicleOnInitialize)then
n.enemy.SpawnVehicleOnInitialize()end
TppReinforceBlock.SetUpReinforceBlock()end
for t,e in pairs(n)do
if i(e.Messages)then
n[t]._messageExecTable=Tpp.MakeMessageExecTable(e.Messages())end
end
if mvars.loc_locationCommonTable then
mvars.loc_locationCommonTable.OnInitialize()end
TppLandingZone.OnInitialize()for t,e in ipairs(Tpp._requireList)do
if _G[e].Init then
_G[e].Init(n)end
end
if n.enemy then
if GameObject.DoesGameObjectExistWithTypeName"TppSoldier2"then
GameObject.SendCommand({type="TppSoldier2"},{id="CreateFaceIdList"})end
if t(n.enemy.soldierDefine)then
TppEnemy.DefineSoldiers(n.enemy.soldierDefine)end
if n.enemy.InitEnemy and i(n.enemy.InitEnemy)then
n.enemy.InitEnemy()end
if t(n.enemy.soldierPersonalAbilitySettings)then
TppEnemy.SetUpPersonalAbilitySettings(n.enemy.soldierPersonalAbilitySettings)end
if t(n.enemy.travelPlans)then
TppEnemy.SetTravelPlans(n.enemy.travelPlans)end
TppEnemy.SetUpSoldiers()if t(n.enemy.soldierDefine)then
TppEnemy.InitCpGroups()TppEnemy.RegistCpGroups(n.enemy.cpGroups)TppEnemy.SetCpGroups()if mvars.loc_locationGimmickCpConnectTable then
TppGimmick.SetCommunicateGimmick(mvars.loc_locationGimmickCpConnectTable)end
end
if t(n.enemy.interrogation)then
TppInterrogation.InitInterrogation(n.enemy.interrogation)end
if t(n.enemy.useGeneInter)then
TppInterrogation.AddGeneInter(n.enemy.useGeneInter)end
if t(n.enemy.uniqueInterrogation)then
TppInterrogation.InitUniqueInterrogation(n.enemy.uniqueInterrogation)end
do
local e
if t(n.enemy.routeSets)then
e=n.enemy.routeSets
for e,n in pairs(e)do
if not t(mvars.ene_soldierDefine[e])then
end
end
end
if e then
TppEnemy.RegisterRouteSet(e)TppEnemy.MakeShiftChangeTable()TppEnemy.SetUpCommandPost()TppEnemy.SetUpSwitchRouteFunc()end
end
if n.enemy.soldierSubTypes then
TppEnemy.SetUpSoldierSubTypes(n.enemy.soldierSubTypes)end
TppRevenge.SetUpEnemy()TppEnemy.ApplyPowerSettingsOnInitialize()TppEnemy.ApplyPersonalAbilitySettingsOnInitialize()TppEnemy.SetOccasionalChatList()TppEneFova.ApplyUniqueSetting()if n.enemy.SetUpEnemy and i(n.enemy.SetUpEnemy)then
n.enemy.SetUpEnemy()end
if TppMission.IsMissionStart()then
TppEnemy.RestoreOnMissionStart2()else
TppEnemy.RestoreOnContinueFromCheckPoint2()end
end
if not TppMission.IsMissionStart()then
TppWeather.RestoreFromSVars()TppMarker.RestoreMarkerLocator()end
TppPlayer.RestoreSupplyCbox()TppPlayer.RestoreSupportAttack()TppTerminal.MakeMessage()if n.sequence then
local e=n.sequence.SetUpRoutes
if e and i(e)then
e()end
TppEnemy.RegisterRouteAnimation()local e=n.sequence.SetUpLocation
if e and i(e)then
e()end
end
for n,e in pairs(n)do
if e.OnRestoreSVars then
e.OnRestoreSVars()end
end
TppMission.RestoreShowMissionObjective()TppRevenge.SetUpRevengeMine()if TppPickable.StartToCreateFromLocators then
TppPickable.StartToCreateFromLocators()end
if TppPlaced and TppPlaced.StartToCreateFromLocators then
TppPlaced.StartToCreateFromLocators()end
if TppMission.IsMissionStart()then
TppRadioCommand.RestoreRadioState()else
TppRadioCommand.RestoreRadioStateContinueFromCheckpoint()end
TppMission.PostMissionOrderBoxPositionToBuddyDog()e.SetUpdateFunction(n)e.SetMessageFunction(n)TppQuest.UpdateActiveQuest()TppDevelopFile.OnMissionCanStart()if TppMission.GetMissionID()==30010 or TppMission.GetMissionID()==30020 then
if TppQuest.IsActiveQuestHeli()then
TppEnemy.ReserveQuestHeli()end
end
TppDemo.UpdateNuclearAbolitionFlag()end
function e.SetUpdateFunction(e)o={}p=0
T={}a=0
d={}u=0
o={TppMission.Update,TppSequence.Update,TppSave.Update,TppDemo.Update,TppPlayer.Update,TppMission.UpdateForMissionLoad}p=#o
for n,e in pairs(e)do
if i(e.OnUpdate)then
a=a+1
T[a]=e.OnUpdate
end
end
end
function e.OnEnterMissionPrepare()if TppMission.IsMissionStart()then
TppScriptBlock.PreloadSettingOnMissionStart()end
TppScriptBlock.ReloadScriptBlock()end
function e.OnTextureLoadingWaitStart()if not TppMission.IsHelicopterSpace(vars.missionCode)then
StageBlockCurrentPositionSetter.SetEnable(false)end
gvars.canExceptionHandling=true
end
function e.OnMissionStartSaving()end
function e.OnMissionCanStart()if TppMission.IsMissionStart()then
TppWeather.SetDefaultWeatherProbabilities()TppWeather.SetDefaultWeatherDurations()if(not gvars.ini_isTitleMode)and(not TppMission.IsFOBMission(vars.missionCode))then
TppSave.VarSave(nil,true)end
end
TppLocation.ActivateBlock()TppWeather.OnMissionCanStart()TppMarker.OnMissionCanStart()TppResult.OnMissionCanStart()TppQuest.InitializeQuestLoad()TppRatBird.OnMissionCanStart()TppMission.OnMissionStart()if mvars.loc_locationCommonTable then
mvars.loc_locationCommonTable.OnMissionCanStart()end
TppLandingZone.OnMissionCanStart()TppOutOfMissionRangeEffect.Disable(0)if TppLocation.IsMiddleAfrica()then
TppGimmick.MafrRiverPrimSetting()end
if MotherBaseConstructConnector.RefreshGimmicks then
if vars.locationCode==TppDefine.LOCATION_ID.MTBS then
MotherBaseConstructConnector.RefreshGimmicks()end
end
if vars.missionCode==10240 and TppLocation.IsMBQF()then
Player.AttachGasMask()end
end
function e.OnMissionGameStart(n)TppClock.Start()if not gvars.ini_isTitleMode then
PlayRecord.RegistPlayRecord"MISSION_START"end
TppQuest.InitializeQuestActiveStatus()if mvars.seq_demoSequneceList[mvars.seq_missionStartSequence]then
e.EnableGameStatusForDemo()else
e.EnableGameStatus()end
if Player.RequestChickenHeadSound~=nil then
Player.RequestChickenHeadSound()end
TppTerminal.OnMissionGameStart()if TppSequence.IsLandContinue()then
TppMission.EnableAlertOutOfMissionAreaIfAlertAreaStart()end
TppSoundDaemon.ResetMute"Telop"end
function e.ClearStageBlockMessage()StageBlock.ClearLargeBlockNameForMessage()StageBlock.ClearSmallBlockIndexForMessage()end
function e.ReservePlayerLoadingPosition(n,o,s,t,i,a,p)e.DisableGameStatus()if n==TppDefine.MISSION_LOAD_TYPE.MISSION_FINALIZE then
if t then
TppHelicopter.ResetMissionStartHelicopterRoute()TppPlayer.ResetInitialPosition()TppPlayer.ResetMissionStartPosition()TppPlayer.ResetNoOrderBoxMissionStartPosition()TppMission.ResetIsStartFromHelispace()TppMission.ResetIsStartFromFreePlay()elseif o then
if gvars.heli_missionStartRoute~=0 then
TppPlayer.SetStartStatusRideOnHelicopter()if mvars.mis_helicopterMissionStartPosition then
TppPlayer.SetInitialPosition(mvars.mis_helicopterMissionStartPosition,0)TppPlayer.SetMissionStartPosition(mvars.mis_helicopterMissionStartPosition,0)end
else
TppPlayer.SetStartStatus(TppDefine.INITIAL_PLAYER_STATE.ON_FOOT)local e=TppDefine.NO_HELICOPTER_MISSION_START_POSITION[vars.missionCode]if e then
TppPlayer.SetInitialPosition(e,0)TppPlayer.SetMissionStartPosition(e,0)else
TppPlayer.ResetInitialPosition()TppPlayer.ResetMissionStartPosition()end
end
TppPlayer.ResetNoOrderBoxMissionStartPosition()TppMission.SetIsStartFromHelispace()TppMission.ResetIsStartFromFreePlay()elseif i then
if TppLocation.IsMotherBase()then
TppPlayer.SetStartStatusRideOnHelicopter()else
TppPlayer.ResetInitialPosition()TppHelicopter.ResetMissionStartHelicopterRoute()TppPlayer.SetStartStatus(TppDefine.INITIAL_PLAYER_STATE.ON_FOOT)TppPlayer.SetMissionStartPositionToCurrentPosition()end
TppPlayer.ResetNoOrderBoxMissionStartPosition()TppMission.ResetIsStartFromHelispace()TppMission.ResetIsStartFromFreePlay()TppLocation.MbFreeSpecialMissionStartSetting(TppMission.GetMissionClearType())elseif(s and TppLocation.IsMotherBase())then
if gvars.heli_missionStartRoute~=0 then
TppPlayer.SetStartStatusRideOnHelicopter()else
TppPlayer.ResetInitialPosition()TppPlayer.ResetMissionStartPosition()end
TppPlayer.ResetNoOrderBoxMissionStartPosition()TppMission.SetIsStartFromHelispace()TppMission.ResetIsStartFromFreePlay()else
if s then
if mvars.mis_orderBoxName then
TppMission.SetMissionOrderBoxPosition()TppPlayer.ResetNoOrderBoxMissionStartPosition()else
TppPlayer.ResetInitialPosition()TppPlayer.ResetMissionStartPosition()local e={[10020]={1449.3460693359,339.18698120117,1467.4300537109,-104},[10050]={-1820.7060546875,349.78659057617,-146.44400024414,139},[10070]={-792.00512695313,537.3740234375,-1381.4598388672,136},[10080]={-439.28802490234,-20.472593307495,1336.2784423828,-151},[10140]={499.91635131836,13.07358455658,1135.1315917969,79},[10150]={-1732.0286865234,543.94067382813,-2225.7587890625,162},[10260]={-1260.0454101563,298.75305175781,1325.6383056641,51}}e[11050]=e[10050]e[11080]=e[10080]e[11140]=e[10140]e[10151]=e[10150]e[11151]=e[10150]local e=e[vars.missionCode]if TppDefine.NO_ORDER_BOX_MISSION_ENUM[tostring(vars.missionCode)]and e then
TppPlayer.SetNoOrderBoxMissionStartPosition(e,e[4])else
TppPlayer.ResetNoOrderBoxMissionStartPosition()end
end
local e=TppDefine.NO_ORDER_FIX_HELICOPTER_ROUTE[vars.missionCode]if e then
TppPlayer.SetStartStatusRideOnHelicopter()TppMission.SetIsStartFromHelispace()TppMission.ResetIsStartFromFreePlay()else
TppPlayer.SetStartStatus(TppDefine.INITIAL_PLAYER_STATE.ON_FOOT)TppHelicopter.ResetMissionStartHelicopterRoute()TppMission.ResetIsStartFromHelispace()TppMission.SetIsStartFromFreePlay()end
local e=TppMission.GetMissionClearType()TppQuest.SpecialMissionStartSetting(e)else
TppPlayer.ResetInitialPosition()TppPlayer.ResetMissionStartPosition()TppPlayer.ResetNoOrderBoxMissionStartPosition()TppMission.ResetIsStartFromHelispace()TppMission.ResetIsStartFromFreePlay()end
end
elseif n==TppDefine.MISSION_LOAD_TYPE.MISSION_ABORT then
TppPlayer.ResetInitialPosition()TppHelicopter.ResetMissionStartHelicopterRoute()TppMission.ResetIsStartFromHelispace()TppMission.ResetIsStartFromFreePlay()if a then
if i then
TppPlayer.SetStartStatus(TppDefine.INITIAL_PLAYER_STATE.ON_FOOT)TppHelicopter.ResetMissionStartHelicopterRoute()TppPlayer.SetMissionStartPositionToCurrentPosition()TppPlayer.ResetNoOrderBoxMissionStartPosition()elseif t then
TppPlayer.ResetMissionStartPosition()elseif vars.missionCode~=5 then
end
else
if t then
TppHelicopter.ResetMissionStartHelicopterRoute()TppPlayer.ResetInitialPosition()TppPlayer.ResetMissionStartPosition()elseif i then
TppMission.SetMissionOrderBoxPosition()elseif vars.missionCode~=5 then
end
end
elseif n==TppDefine.MISSION_LOAD_TYPE.MISSION_RESTART then
elseif n==TppDefine.MISSION_LOAD_TYPE.CONTINUE_FROM_CHECK_POINT then
end
if o and p then
Mission.AddLocationFinalizer(function()e.StageBlockCurrentPosition()end)else
e.StageBlockCurrentPosition()end
end
function e.StageBlockCurrentPosition(e)if vars.initialPlayerFlag==PlayerFlag.USE_VARS_FOR_INITIAL_POS then
StageBlockCurrentPositionSetter.SetEnable(true)StageBlockCurrentPositionSetter.SetPosition(vars.initialPlayerPosX,vars.initialPlayerPosZ)else
StageBlockCurrentPositionSetter.SetEnable(false)end
if TppMission.IsHelicopterSpace(vars.missionCode)then
StageBlockCurrentPositionSetter.SetEnable(true)StageBlockCurrentPositionSetter.DisablePosition()if e then
while not StageBlock.LargeAndSmallBlocksAreEmpty()do
coroutine.yield()end
end
end
end
function e.OnReload(n)for t,e in pairs(n)do
if i(e.OnLoad)then
e.OnLoad()end
if i(e.Messages)then
n[t]._messageExecTable=Tpp.MakeMessageExecTable(e.Messages())end
end
if n.enemy then
if t(n.enemy.routeSets)then
TppClock.UnregisterClockMessage"ShiftChangeAtNight"TppClock.UnregisterClockMessage"ShiftChangeAtMorning"TppEnemy.RegisterRouteSet(n.enemy.routeSets)TppEnemy.MakeShiftChangeTable()end
end
for t,e in ipairs(Tpp._requireList)do
if _G[e].OnReload then
_G[e].OnReload(n)end
end
if mvars.loc_locationCommonTable then
mvars.loc_locationCommonTable.OnReload()end
if n.sequence then
TppCheckPoint.RegisterCheckPointList(n.sequence.checkPointList)end
e.SetUpdateFunction(n)e.SetMessageFunction(n)end
function e.OnUpdate(e)local e
local n=o
local t=T
local e=d
for e=1,p do
n[e]()end
for e=1,a do
t[e]()end
m()end
function e.OnChangeSVars(e,n,t)for i,e in ipairs(Tpp._requireList)do
if _G[e].OnChangeSVars then
_G[e].OnChangeSVars(n,t)end
end
end
function e.SetMessageFunction(e)S={}s=0
c={}r=0
for n,e in ipairs(Tpp._requireList)do
if _G[e].OnMessage then
s=s+1
S[s]=_G[e].OnMessage
end
end
for n,t in pairs(e)do
if e[n]._messageExecTable then
r=r+1
c[r]=e[n]._messageExecTable
end
end
end
function e.OnMessage(e,n,t,i,l,a,p)local e=mvars
local o=""local T
local m=Tpp.DoMessage
local d=TppMission.CheckMessageOption
local T=TppDebug
local T=P
local T=h
local T=TppDefine.MESSAGE_GENERATION[n]and TppDefine.MESSAGE_GENERATION[n][t]if not T then
T=TppDefine.DEFAULT_MESSAGE_GENERATION
end
local u=M()if u<T then
return Mission.ON_MESSAGE_RESULT_RESEND
end
for e=1,s do
local o=o
S[e](n,t,i,l,a,p,o)end
for e=1,r do
local o=o
m(c[e],d,n,t,i,l,a,p,o)end
if e.loc_locationCommonTable then
e.loc_locationCommonTable.OnMessage(n,t,i,l,a,p,o)end
if e.order_box_script then
e.order_box_script.OnMessage(n,t,i,l,a,p,o)end
if e.animalBlockScript and e.animalBlockScript.OnMessage then
e.animalBlockScript.OnMessage(n,t,i,l,a,p,o)end
end
function e.OnTerminate(e)if e.sequence then
if i(e.sequence.OnTerminate)then
e.sequence.OnTerminate()end
end
end
return e