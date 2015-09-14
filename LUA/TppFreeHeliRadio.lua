local e={}local n=Fox.StrCode32
local n=Tpp.StrCode32Table
local o=bit.band
local a=GameObject.SendCommand
e.DAY_TIME=3
e.NIGHT_TIME=19
e.DAY_TO_NIGHT=string.format("%d:00:00",e.NIGHT_TIME)e.NIGHT_TO_DAY=string.format("%d:00:00",e.DAY_TIME)e.isPlayBreefing=false
e.ON_ENTER_RESULT={START_PANDEMIC_TUTORIAL=1}e.PANDEMIC_RADIO={START="f2000_rtrg9000",START_FREE={"f2000_rtrg9005"},START_CONTINED_IN_HELI={"f2000_rtrg9010","f2000_rtrg9020","f2000_rtrg9030","f2000_rtrg9040"},OPEN_TERMINAL="f2000_rtrg9060",OPEN_TERMINAL_SELECT="f2000_rtrg9080",PANDEMIC_FACILITY="f2000_rtrg9100",ON_ISOLATE_STAFF="f2000_rtrg9110",NO_ISOLATED_YET="f2000_rtrg9150",ISOLATE_FAILED="f2000_rtrg9170",ISOLATE_FAILED_HINT="f2000_rtrg9190",ISOLATE_SUCCEED_A_FEW="f2000_rtrg9220",ISOLATE_SUCCEED_HINT="f2000_rtrg9200",ISOLATE_SUCCEED_MANY="f2000_rtrg9240",FINISH="f2000_rtrg9250",FINISH_ADD="f2000_rtrg9260"}function e.DeclareSVars()return{{name="freeRadio_isPlayed",type=TppScriptVars.TYPE_BOOL,value=false,save=true,sync=false,wait=false,category=TppScriptVars.CATEGORY_MISSION},nil}end
function e.Messages()return n{Player={{msg="CalcFultonPercent",func=function(n,i,n,n,n)if Tpp.IsSoldier(i)then
local n="f2000_rtrg0040"if(not TppRadio.IsPlayed(n)and TppRadio.IsPlayed"f2000_oprg0210")and(not TppStory.IsMissionCleard(10040))then
e._PlayRadio(n)end
if not TppStory.IsMissionCleard(10070)then
local n="f2000_rtrg0060"local i=a(i,{id="GetStateFlag"})if(o(i,StateFlag.DYING_LIFE)~=0)then
if not TppRadio.IsPlayed(n)then
e._PlayRadio(n)end
end
end
end
end}},GameObject={{msg="PlayerGetAway",func=function(n)if Tpp.IsHostage(n)then
e._UnregisterOptionRadio"f2000_oprg0105"end
end},{msg="PlayerGetNear",func=function(n)if Tpp.IsHostage(n)then
e._RegisterOptionRadio"f2000_oprg0105"end
end},{msg="Unconscious",func=function(i)local n="f2000_oprg0210"if(Tpp.IsSoldier(i)and(not mvars.FreeHeliRadio_addOptionRadioCount[n]))and(not TppStory.IsMissionCleard(10040))then
e._RegisterOptionRadio(n)end
end},{msg="FultonFailed",func=function(i,t,t,n)if Tpp.IsSoldier(i)and n==TppGameObject.FULTON_FAILED_TYPE_ON_FINISHED_RISE then
local n="f2000_rtrg1240"if(vars.weather~=TppDefine.WEATHER.SUNNY)and(not TppRadio.IsPlayed(n))then
e._PlayRadio(n)else
local n=a(i,{id="GetStateFlag"})if(o(n,StateFlag.DYING_LIFE)~=0)and(math.random(1,2)<2)then
e._PlayRadio"f2000_rtrg0070"else
e._PlayRadio"f2000_rtrg0050"end
end
end
end}},MotherBaseManagement={{msg="UpdatedPandemic",func=e.UpdatePandemicEvent}},Terminal={{msg="MbDvcActCloseTop",func=function()end}},Weather={{msg="Clock",sender="ChangeDayToNight",func=function(n,n)e.RegistNvgOptionRadio()end},{msg="Clock",sender="ChangeNightToDay",func=function(n,n)e.UnregistNvgOptionRadio()end},{msg="ChangeWeathre",func=function(i)local n="f2000_oprg0185"if i==TppDefine.WEATHER.SANDSTORM then
e._RegisterOptionRadio(n)else
e._UnregisterOptionRadio(n)end
end}},Radio={{msg="Finish",sender="f1000_rtrg3120",func=function()TppStory.UpdateStorySequence{updateTiming="OnEndRtrg3120",isInGame=true}end}}}end
function e._OnReload()e.SetupMessages()end
function e.OnReload()local n=TppMission.IsHelicopterSpace(vars.missionCode)local i=TppMission.IsFreeMission(vars.missionCode)if(n or i)and(vars.missionCode~=30050)then
e.SetupMessages()else
e.messageExecTable=nil
end
end
function e.SetupMessages()e.messageExecTable=Tpp.MakeMessageExecTable(e.Messages())end
function e.OnMessage(d,r,t,a,o,n,i)Tpp.DoMessage(e.messageExecTable,TppMission.CheckMessageOption,d,r,t,a,o,n,i)end
function e.OnEnter()e._RegistClock()e.SetupMessages()mvars.FreeHeliRadio_addOptionRadioCount={}mvars.FreeHeliRadio_animalRadioGroup=nil
mvars.FreeHeliRadio_nvgRadioGroup=nil
TppMission.RegisterMissionSystemCallback{OnAddStaffsFromTempBuffer=e.OnAddStaffsFromTempBuffer}TppCassette.OnEnterFreeHeliPlay()local n={}if TppMotherBaseManagement.GetStaffCount()<=10 then
e._RegisterOptionRadio"f2000_oprg0020"end
if TppMotherBaseManagement.GetDevelopedEquipCount()<=5 then
e._RegisterOptionRadio"f2000_oprg0030"end
if not TppStory.IsMissionCleard(10040)then
e._RegisterOptionRadio"f2000_oprg0220"end
if not e._IsTimeOfDay()then
e.RegistNvgOptionRadio()end
if vars.weather==TppDefine.WEATHER.SANDSTORM then
e._RegisterOptionRadio"f2000_oprg0185"end
local n=e.TryPandemicStart()if TppTerminal.CheckPandemicEventFinish()then
TppTerminal.FinishPandemicEvent()end
local i=TppStory.GetCurrentStorySequence()local i=TppStory.GetClearedMissionCount{10036,10033,10043}local i=TppStory.GetClearedMissionCount{10041,10044,10052,10054}local i=TppStory.GetClearedMissionCount{10010,10020,10030,10036,10043,10033,10040,10041,10044,10052,10054,10050,10070,10080,10086,10082,10090,10091,10195,10100,10110,10121,10115,10120,10085,10200,10211,10081,10130,10140,10150,10151,10045,10156,10093,10171}if n then
return e.ON_ENTER_RESULT.START_PANDEMIC_TUTORIAL
end
if not svars.freeRadio_isPlayed then
svars.freeRadio_isPlayed=true
local n=TppStory.GetForceMBDemoNameOrRadioList"freeHeliRadio"if n then
e._PlayRadio(n)end
end
end
function e.Init()e.messageExecTable=nil
end
function e.OnLeave()end
function e.RegistNvgOptionRadio()mvars.FreeHeliRadio_nvgRadioGroup=nil
if not TppMotherBaseManagement.IsEquipDeveloped{equipID=TppEquip.EQP_IT_Nvg}then
if TppPlayer.GetBulletNum(TppEquip.BL_IT_TimeCigarette)>0 then
mvars.FreeHeliRadio_nvgRadioGroup="f2000_oprg0200"else
mvars.FreeHeliRadio_nvgRadioGroup="f2000_oprg0190"end
e._RegisterOptionRadio(mvars.FreeHeliRadio_nvgRadioGroup)end
end
function e.UnregistNvgOptionRadio()if mvars.FreeHeliRadio_nvgRadioGroup then
e._UnregisterOptionRadio(mvars.FreeHeliRadio_nvgRadioGroup)end
end
function e.RegistAnimalOptionalRadio(n)if not mvars.FreeHeliRadio_addOptionRadioCount then
return
end
if n=="Goat"then
mvars.FreeHeliRadio_animalRadioGroup="f2000_oprg0065"elseif n=="Wolf"then
mvars.FreeHeliRadio_animalRadioGroup="f2000_oprg0075"end
if mvars.FreeHeliRadio_animalRadioGroup then
e._RegisterOptionRadio(mvars.FreeHeliRadio_animalRadioGroup)end
end
function e.UnregistAnimalOptionalRadio()if not mvars.FreeHeliRadio_addOptionRadioCount then
return
end
if mvars.FreeHeliRadio_animalRadioGroup then
e._UnregisterOptionRadio(mvars.FreeHeliRadio_animalRadioGroup)mvars.FreeHeliRadio_animalRadioGroup=nil
end
end
function e.OnEnterCpIntelTrap(n)if not mvars.FreeHeliRadio_addOptionRadioCount then
return
end
e._RegisterOptionRadio"f2000_oprg0115"e._RegisterOptionRadio"f2000_oprg0125"e._RegisterOptionRadio"f2000_oprg0130"e._RegisterOptionRadio"f2000_oprg0165"e._RegisterOptionRadio"f2000_oprg0175"if TppClock.GetTimeOfDay()=="night"then
e._RegisterOptionRadio"f2000_oprg0165"else
e._RegisterOptionRadio"f2000_oprg0155"end
end
function e.OnExitCpIntelTrap(n)if not mvars.FreeHeliRadio_addOptionRadioCount then
return
end
e._UnregisterOptionRadio"f2000_oprg0115"e._UnregisterOptionRadio"f2000_oprg0125"e._UnregisterOptionRadio"f2000_oprg0130"e._UnregisterOptionRadio"f2000_oprg0175"e._UnregisterOptionRadio"f2000_oprg0165"e._UnregisterOptionRadio"f2000_oprg0155"end
function e.TryPandemicStart()local n=false
if not TppTerminal.IsNeedPlayPandemicTutorialRadio()then
return n
end
local i=TppMission.IsHelicopterSpace(vars.missionCode)local o=TppMission.IsFreeMission(vars.missionCode)if not TppMotherBaseManagement.IsPandemicEventMode()then
TppTerminal.StartPandemicEvent()n=true
end
if TppMotherBaseManagement.IsPandemicEventMode()then
if not TppRadio.IsPlayed"f2000_rtrg9010"then
if i then
e._PlayRadio(e.PANDEMIC_RADIO.START_CONTINED_IN_HELI)n=true
end
end
end
if TppDemo.IsPlayedMBEventDemo"QuietReceivesPersecution"then
TppCassette.Acquire{cassetteList={"tp_c_00000_16"},pushReward=true}end
return n
end
local i=.85
local a=.2
function e.UpdatePandemicEvent(o,n)TppTerminal.UpdatePandemicEventBingoCount()local t,t,n=TppTerminal.GetPandemicBingoCount()if n>i then
if not TppRadio.IsPlayed(e.PANDEMIC_RADIO.FINISH)then
e._PlayRadio(e.PANDEMIC_RADIO.FINISH)end
return
end
if n>a then
if not TppRadio.IsPlayed(e.PANDEMIC_RADIO.ISOLATE_SUCCEED_MANY)then
e._PlayRadio(e.PANDEMIC_RADIO.ISOLATE_SUCCEED_MANY)end
return
end
if(o>0)then
if not gvars.trm_doneIsolateByManual then
e._PlayRadio(e.PANDEMIC_RADIO.NO_ISOLATED_YET)return
end
end
end
function e._RegistClock()TppClock.RegisterClockMessage("ChangeDayToNight",e.DAY_TO_NIGHT)TppClock.RegisterClockMessage("ChangeNightToDay",e.NIGHT_TO_DAY)end
function e._PlayRadio(e)TppRadio.Play(e,{isEnqueue=true,delayTime="long"})end
function e._RegisterOptionRadio(e)local n=mvars.FreeHeliRadio_addOptionRadioCount[e]if n then
mvars.FreeHeliRadio_addOptionRadioCount[e]=n+1
else
local n=0
TppRadioCommand.RegisterRadioGroupToActiveRadioGroupSetInsert(e,n)mvars.FreeHeliRadio_addOptionRadioCount[e]=1
end
end
function e._UnregisterOptionRadio(e,i)local n=mvars.FreeHeliRadio_addOptionRadioCount[e]if n then
if n>1 then
mvars.FreeHeliRadio_addOptionRadioCount[e]=n-1
else
mvars.FreeHeliRadio_addOptionRadioCount[e]=nil
end
else
if i then
end
end
TppRadioCommand.UnregisterRadioGroupFromActiveRadioGroupSet(e)end
function e._IsRegistOptionRadio(e)return mvars.FreeHeliRadio_addOptionRadioCount[e]end
function e._IsTimeOfDay()local n=TppClock.GetTime"time"return(n>=e.DAY_TIME)and(n<=e.NIGHT_TIME)end
return e