local e={}local r=Fox.StrCode32
local i=Tpp.IsTypeTable
local o=GameObject.GetGameObjectId
local a=GameObject.NULL_ID
local s=FadeFunction.CallFadeIn
local d=FadeFunction.CallFadeOut
local u=0
e.FADE_SPEED={FADE_MOMENT=0,FADE_HIGHESTSPEED=.5,FADE_HIGHSPEED=1,FADE_NORMALSPEED=2,FADE_LOWSPEED=4,FADE_LOWESTSPEED=8}e.ANNOUNCE_LOG_TYPE={updateMissionInfo="announce_mission_info_update",updateMissionInfo_AddDocument="announce_doc_add",updateMap="announce_map_update",recoverTarget="announce_target_extract",eliminateTarget="announce_target_eliminate",destroyTarget="announce_target_destroy",achieveObjectiveCount="announce_objective_complete_num",achieveAllObjectives="announce_objective_complete",emergencyMissionOccur="announce_mission_add_emerg",deleteEmergencyMission="announce_mission_del_emerg",getIntel="announce_get_intel_file",recoverTargetCount="announce_target_extract_num",recoverEnemy="announce_collection_enemy",recoverHostage="announce_collection_hostage",target_died="announce_target_died",target_eliminate_failed="announce_target_eliminate_failed",target_extract_failed="announce_target_extract_failed",staff_dead="announce_staff_dead",staff_dying="announce_staff_dying",hostage_died="announce_hostage_died",fob_sneaking_failed="announce_fob_sneaking_failed",boy_died="announce_boy_died",leaveHotZone="announce_left_hot_zone",closeOutOfMissionArea="announce_mission_area_warning",callHeliRecieved="announce_support_callheli_received",heliArrivedLZ="announce_heli_arrive_LZ",callSupportBuddyReceived="announce_support_callboddy_received",gmpGet="announce_ops_get_gmp",gmpCostFulton="announce_gmp_cost_fulton",gmpCostSupply="announce_gmp_cost_supply",gmpCostAttack="announce_gmp_cost_attack",gmpCostHeli="announce_gmp_cost_heli",gmpCostOps="announce_gmp_cost_ops",extractionAllived="announce_extraction_arrived",extractSoldiers="announce_extract_soldier",extractPrisoners="announce_extract_prisoner",getDiamond="announce_get_diamond",unitLvUpRd="announce_unit_lvup_RD",unitLvUpBaseDev="announce_unit_lvup_base_dev",unitLvUpSupport="announce_unit_lvup_support",unitLvUpIntel="announce_unit_lvup_intel",unitLvUpCombat="announce_unit_lvup_combat",unitLvUpSecurity="announce_unit_lvup_security",unitLvUpMedical="announce_unit_lvup_medical",unitLvDownRd="announce_unit_lvdown_RD",unitLvDownBaseDev="announce_unit_lvdown_base_dev",unitLvDownSupport="announce_unit_lvdown_support",unitLvDownIntel="announce_unit_lvdown_intel",unitLvDownCombat="announce_unit_lvdown_combat",unitLvDownSecurity="announce_unit_lvdown_security",unitLvDownMedical="announce_unit_lvdown_medical",missionListUpdate="announce_mission_list_update",missionAdd="announce_mission_add",extractionFailed="announce_extraction_failed",sunset="announce_sunset",sunrise="announce_sunrise",weather_sunny="announce_weather_sunny",weather_cloudy="announce_weather_cloudy",weather_rainy="announce_weather_rain",weather_sandstorm="announce_weather_sandstorm",weather_foggy="announce_weather_fog",getKyeItem="announce_ops_get_item",getPoster="announce_get_gravure",destroyRadar="announce_destroy_radar",unlockLz="announce_unlock_lz",heroicPointUp="announce_fame_up",heroicPointDown="announce_fame_down",outpost_neutralize="announce_outpost_neutralize",guradpost_neutralize="announce_guradpost_neutralize",announce_nuclear_zero="announce_nuclear_zero",fob_add="announce_fob_add",fobReqHelp="announce_fob_req_help",fobFindIntruder="announce_fob_find_intruder",fobFound="announce_fob_found",fobWormholeFrom="announce_fob_wormhole_from",fobWormholeTo="announce_fob_wormhole_to",fobReport="announce_online_910_from_0_prio_0",fobStolenStaff="announce_staff_num",task_complete="announce_task_complete",fobDefFailed="announce_fob_def_failed",fobDefSuccess="announce_fob_def_success",fobDefSuccessPra="announce_fob_def_success_pra",fobRivalArrive="announce_fob_helper_arrive",fobRivalEscape="announce_fob_helper_escape",fobIntruderEscape="announce_fob_intruder_escape",fobNoticeIntruder="announce_online_900_from_0_prio_0",fobReqPractice="announce_fob_req_practice",fobVisitFob="announce_fob_visit_fob",fobVisitFob1="announce_fob_visit_fob1",fobVisitFob2="announce_fob_visit_fob2",fobVisitFob3="announce_fob_visit_fob3",fobVisitFob4="announce_fob_visit_fob4",fobBatrayed="announce_fob_batrayed",fobBetray="announce_fob_betray",espPf_a="announce_esp_pf_a",espFulton_a="announce_esp_fulton_a",espFulton_d="announce_esp_fulton_d",espFultonContainer_a="announce_esp_container_fulton_a",espFultonContainer_d="announce_esp_container_fulton_d",espKill_a="announce_esp_kill_a",espKill_d="announce_esp_kill_d",espDestroy_a="announce_esp_destroy_a",espDestroy_d="announce_esp_destroy_d",espKillStaff_a="announce_esp_killstaff_a",espKillStaff_d="announce_esp_killstaff_d",espMarking_d="announce_esp_marking_d",espKillTarget_d="announce_esp_kill_target_d",fob_leave_owner="announce_fob_leave_owner",fob_leave_visiter="announce_fob_leave_fob",espFultonTarget_d="announce_esp_target_fulton_d",fob_practice_fin="announce_fob_practice_fin",esp_stun="announce_esp_stun",esp_sleep="announce_esp_sleep",esp_stun_d="announce_esp_stun_df",esp_sleep_d="announce_esp_sleep_df",esp_stun_a="announce_esp_stun_at",esp_sleep_a="announce_esp_sleep_at",mbstaff_died="announce_mbstaff_died",horse_died="announce_horse_died",quiet_died="announce_quiet_died",ddog_died="announce_ddog_died",dwalker_died="announce_dwalker_died",quest_add="announce_quest_add",quest_complete="announce_quest_complete",quest_delete="announce_quest_delete",quest_list_update="announce_quest_list_update",quest_defeat_armor="announce_quest_defeat_armor",quest_defeat_zombie="announce_quest_defeat_zombie",mine_quest_log="announce_quest_disposal_mine",quest_extract_elite="announce_quest_extract_elite",quest_extract_hostage="announce_quest_extract_hostage",quest_defeat_armor_vehicle="announce_quest_defeat_armor_vehicle",quest_defeat_tunk="announce_quest_defeat_tunk",quest_get_photo="announce_get_photo",quest_target_eliminate="announce_quest_target_destroy",find_keyitem="announce_find_keyitem",find_em_string="announce_find_em_string",find_em_back="announce_find_em_back",find_em_front="announce_find_em_front",get_tape="announce_get_tape",looting_weapon="announce_looting_weapon",get_wgear="announce_get_wgear",add_delivery_point="announce_add_delivery_point",get_invoice="announce_get_invoice",disposal_mine="announce_disposal_mine",disposal_decoy="announce_disposal_decoy",destroyed_skull="announce_destroyed_skull",trial_update="announce_trial_update",destroyed_support_heli="announce_destroyed_support_heli",add_alt_machine="announce_add_alt_machine",get_blueprint="announce_get_blueprint",recoveredFilmCase="announce_get_film_case",find_processed_res="announce_find_processed_res",find_diamond="announce_find_diamond",find_plant="announce_find_plant",refresh="announce_refresh",get_hero="announce_get_hero",lost_hero="announce_lost_hero"}e.ANNOUNCE_LOG_PRIORITY={"eliminateTarget","recoveredFilmCase","recoverTarget","destroyTarget","achieveAllObjectives","achieveObjectiveCount","getIntel","updateMissionInfo","updateMissionInfo_AddDocument","updateMap"}e.BUDDY_LANG_ID={[BuddyType.HORSE]="name_buddy_dh",[BuddyType.DOG]="name_buddy_dd",[BuddyType.QUIET]="marker_chara_quiet"}e.EMBLEM_ANNOUNCE_LOG_TYPE={[Fox.StrCode32"front"]="find_em_front",[Fox.StrCode32"base"]="find_em_back",[Fox.StrCode32"word"]="find_em_string"}function e.Messages()return Tpp.StrCode32Table{GameObject={{msg="ArrivedAtLandingZoneWaitPoint",sender="SupportHeli",func=function()e.ShowAnnounceLog"heliArrivedLZ"end}},UI={{msg="EndFadeIn",func=e.EnableGameStatusOnFade,option={isExecMissionClear=true,isExecDemoPlaying=true,isExecGameOver=true}},{msg="EndFadeOut",func=e.DisableGameStatusOnFadeOutEnd,option={isExecMissionClear=true,isExecDemoPlaying=true,isExecGameOver=true}},{msg="ConfigurationUpdated",func=function()if vars.missionCode==TppDefine.SYS_MISSION_ID.INIT then
return
end
TppSave.VarSaveConfig()if TppSave.IsSavingWithFileName(TppDefine.CONFIG_SAVE_FILE_NAME)or TppSave.HasQueue(TppDefine.CONFIG_SAVE_FILE_NAME)then
return
end
TppSave.SaveConfigData()end,option={isExecGameOver=true}},{msg="DisplayTimerLap",func=function(e,n)if not mvars.ui_displayTimeSecSvarsName then
return
end
svars[mvars.ui_displayTimeSecSvarsName]=e
end},{msg="StartMissionTelopFadeOut",func=function()TppSoundDaemon.ResetMute"Telop"end}},Radio={{msg="Finish",func=function(n)if TppRadio.CheckRadioGroupIsCommonRadio(n,TppDefine.COMMON_RADIO.CALL_SUPPROT_BUDDY)then
e.ShowCallSupportBuddyAnnounceLog()end
end}}}end
local function t(e)if type(e)=="string"then
return Fox.StrCode32(e)elseif type(e)=="number"then
return e
end
return nil
end
function e.FadeIn(o,i,a,n)local i=t(i)if n then
mvars.ui_onEndFadeInExceptGameStatus=n.exceptGameStatus
elseif mvars.ui_onEndFadeInOverrideExceptGameStatus then
mvars.ui_onEndFadeInExceptGameStatus=mvars.ui_onEndFadeInOverrideExceptGameStatus
else
mvars.ui_onEndFadeInExceptGameStatus=nil
end
TppSoundDaemon.ResetMute"Outro"s(o,i,a)e.EnableGameStatusOnFadeInStart()end
function e.OverrideFadeInGameStatus(e)mvars.ui_onEndFadeInOverrideExceptGameStatusTemporary=e
end
function e.UnsetOverrideFadeInGameStatus()mvars.ui_onEndFadeInOverrideExceptGameStatusTemporary=nil
end
function e.GetOverrideGameStatus()return mvars.ui_onEndFadeInOverrideExceptGameStatusTemporary
end
function e.SetFadeColorToBlack()FadeFunction.SetFadeColor(0,0,0,255)end
function e.SetFadeColorToWhite()FadeFunction.SetFadeColor(255,255,255,255)end
function e.FadeOut(s,o,p,n)local i,a
if Tpp.IsTypeTable(n)then
i=n.setMute
a=n.exceptGameStatus
end
local n=t(o)e.DisableGameStatusOnFade(a)if i then
TppSound.SetMuteOnLoading()else
if(not TppSoundDaemon.CheckCurrentMuteIs"Pause")and(not TppSoundDaemon.CheckCurrentMuteMoreThan"Outro")then
TppSoundDaemon.SetMute"Outro"end
end
d(s,n,p)end
function e.ShowAnnounceLog(a,t,o,n,i)if gvars.ini_isTitleMode then
return
end
local e=e.ANNOUNCE_LOG_TYPE[a]if e then
if n then
TppUiCommand.AnnounceLogDelayTime(n)end
TppUiCommand.AnnounceLogViewLangId(e,t,o)elseif i then
local e=TppUiCommand.GetCurrentMissionSubGoalByNo(i)TppUiCommand.AnnounceLogViewLangId(e)end
end
function e.ShowColorAnnounceLog(i,a,t,n)if gvars.ini_isTitleMode then
return
end
local e=e.ANNOUNCE_LOG_TYPE[i]if e then
if n then
TppUiCommand.AnnounceLogDelayTime(n)end
TppUiCommand.AnnounceLogViewLangId(e,a,t,0,0,true)end
end
function e.ShowJoinAnnounceLog(i,a,o,t,n)if gvars.ini_isTitleMode then
return
end
local i=e.ANNOUNCE_LOG_TYPE[i]local e=e.ANNOUNCE_LOG_TYPE[a]if i and e then
if n then
TppUiCommand.AnnounceLogDelayTime(n)end
TppUiCommand.AnnounceLogViewJoinLangId(i,e,o,t)end
end
function e.ShowColorJoinAnnounceLog(n,a,o,t,i)if gvars.ini_isTitleMode then
return
end
local n=e.ANNOUNCE_LOG_TYPE[n]local e=e.ANNOUNCE_LOG_TYPE[a]if n and e then
if i then
TppUiCommand.AnnounceLogDelayTime(i)end
TppUiCommand.AnnounceLogViewJoinLangId(n,e,o,t,0,0,true)end
end
function e.ShowEmergencyAnnounceLog(n)e.ShowAnnounceLog"emergencyMissionOccur"if n==true then
TppSoundDaemon.PostEvent"sfx_s_fob_emergency"else
TppSoundDaemon.PostEvent"sfx_s_fob_alert"end
end
function e.EnableMissionPhoto(e,i,n,a,t)TppUiCommand.EnableMissionPhotoId(e)if TppUiCommand.IsMissionPhotoIdEnable(e)then
if i or n then
if i==nil then
i=false
end
if n==nil then
n=false
end
TppUiCommand.SetAdditonalMissionPhotoId(e,i,n)end
if a then
end
if t then
local n=r(t)TppUiCommand.SetMissionPhotoRadioGroupName(e,n)end
end
end
function e.DisableMissionPhoto(e,n)if TppUiCommand.IsMissionPhotoIdEnable(e)then
if n then
TppUiCommand.ResetMissionPhotoRadioGroupName(e)end
TppUiCommand.DisableMissionPhotoId(e)end
end
function e.EnableMissionSubGoal(e)TppUiCommand.SetCurrentMissionSubGoalNo(e)end
function e.EnableSpySearch(e)if not i(e)then
return
end
local n,i
if Tpp.IsTypeString(e.gameObjectName)then
i=e.gameObjectName
n=o(i)elseif Tpp.IsTypeNumber(e.gameObjectId)then
n=e.gameObjectId
else
return
end
if n==a then
return
end
e.gameObjectId=n
TppUiCommand.ActivateSpySearchForGameObject(e)end
function e.DisableSpySearch(e)if not i(e)then
return
end
local n,i
if Tpp.IsTypeString(e.gameObjectName)then
i=e.gameObjectName
n=o(i)elseif Tpp.IsTypeNumber(e.gameObjectId)then
n=e.gameObjectId
else
return
end
if n==a then
return
end
e.gameObjectId=n
TppUiCommand.DeactivateSpySearchForGameObject(e)end
function e.StartMissionTelop(e,i,n)TppSoundDaemon.SetMute"Telop"if e then
TppUiCommand.SetMissionStartTelopId(e)end
TppUiCommand.CallMissionStartTelop(i,n)TppSound.PostJingleOnMissionStartTelop()end
function e.GetMaxMissionTask(e)local e=TppResult.MISSION_TASK_LIST[e]if e then
return#e
end
end
function e.EnableMissionTask(a,t)if t==nil then
t=true
end
if not i(a)then
return
end
local n={}for e,i in pairs(a)do
n[e]=i
end
local i=n.taskNo
if not i then
return
end
if n.isHide==nil then
if n.isFirstHide then
if not TppStory.IsMissionCleard(vars.missionCode)and(not e.IsTaskLastCompleted(i))then
n.isHide=true
else
n.isHide=false
end
else
n.isHide=false
end
end
if n.isComplete then
n.isHide=false
local n=vars.missionCode
local o=e.GetTaskCompletedNumber(n)e.SetTaskLastCompleted(i,true)local i=e.GetTaskCompletedNumber(n)local a=e.GetMaxMissionTask(n)if a==nil then
return
end
if t then
if i>o then
e.ShowAnnounceLog("task_complete",i,a)end
end
if e.IsAllTaskCompleted(n)then
TppEmblem.AcquireOnAllMissionTaskComleted(n)end
end
if e.IsTaskLastCompleted(i)then
n.isLastCompleted=true
else
n.isLastCompleted=false
end
TppUiCommand.EnableMissionTask(n)end
function e.IsTaskLastCompleted(n)local e=e.GetLastCompletedFlagIndex(n)if e then
return gvars.ui_isTaskLastComleted[e]end
end
function e.SetTaskLastCompleted(n,i)local e=e.GetLastCompletedFlagIndex(n)if e then
gvars.ui_isTaskLastComleted[e]=i
end
end
function e.GetLastCompletedFlagIndex(n)return e._GetLastCompletedFlagIndex(vars.missionCode,n)end
function e._GetLastCompletedFlagIndex(n,e)local n=TppDefine.MISSION_ENUM[tostring(n)]if not n then
return
end
if not Tpp.IsTypeNumber(e)then
return
end
if(e<0)or(e>=TppDefine.MAX_MISSION_TASK_COUNT)then
return
end
return n*TppDefine.MAX_MISSION_TASK_COUNT+e
end
function e.GetTaskCompletedNumber(e)local n=TppDefine.MISSION_ENUM[tostring(e)]if not n then
return 0
end
local e=0
for i=0,TppDefine.MAX_MISSION_TASK_COUNT-1 do
local n=n*TppDefine.MAX_MISSION_TASK_COUNT+i
if gvars.ui_isTaskLastComleted[n]then
e=e+1
end
end
return e
end
function e.IsAllTaskCompleted(n)local i=e.GetTaskCompletedNumber(n)local e=e.GetMaxMissionTask(n)if e==nil then
return false
end
if i>=e then
return true
end
return false
end
function e.ShowControlGuide(n)if not i(n)then
return
end
local t,o,i,a,s,p,r
t=n.actionName
o=n.continue
i=n.time
a=n.isOnce
s=n.isOnceThisGame
p=n.pauseControl
r=n.ignoreRadio
if not e.IsEnableToShowGuide(true)then
return
end
if type(t)~="string"then
return
end
local e=TppDefine.CONTROL_GUIDE[t]local n=TppDefine.CONTROL_GUIDE_LANG_ID_LIST[e]if n==nil then
return
end
if a then
if gvars.ui_isControlGuideShownOnce[e]then
return
end
gvars.ui_isControlGuideShownOnce[e]=true
end
if s then
if gvars.ui_isControlGuidShownInThisGame[e]then
return
end
gvars.ui_isControlGuidShownInThisGame[e]=true
end
if not i then
i=TppTutorial.DISPLAY_TIME.DEFAULT
end
TppUiCommand.SetButtonGuideDispTime(i)if not p then
if(o==true)then
TppUiCommand.CallButtonGuideContinue(n,false,false,false)else
TppUiCommand.CallButtonGuide(n,false,false,false)end
else
local e=TppDefine.PAUSE_CONTROL_GUIDE[e]if e then
TppUiCommand.CallControllerHelp(e,n)end
end
local e=TppTutorial.ControlGuideRadioList[e]if e then
TppTutorial.PlayRadio(e)end
end
function e.ShowTipsGuide(n)if not i(n)then
return
end
local i,a,t,r,p,o,s
i=n.contentName
a=n.isOnce
t=n.isOnceThisGame
p=n.time
o=n.ignoreRadio
s=n.ignoreDisplay
if not e.IsEnableToShowGuide(o)then
return
end
if not s then
if TppUiCommand.IsDispGuide"TipsGuide"then
return
end
end
if type(i)~="string"then
return
end
local e=TppDefine.TIPS[i]if e==nil then
return
end
local n=nil
local i=TppDefine.TIPS_REDUNDANT_REF[e]if not i then
n=tostring(e)else
n=tostring(i)end
if n==nil then
return
end
if a and t then
return
end
if a then
if gvars.ui_isTipsGuideShownOnce[e]then
return
end
gvars.ui_isTipsGuideShownOnce[e]=true
end
if t then
if gvars.ui_isTipsGuidShownInThisGame[e]then
return
end
gvars.ui_isTipsGuidShownInThisGame[e]=true
end
TppUiCommand.EnableTips(n,true)TppUiCommand.SetButtonGuideDispTime(TppTutorial.DISPLAY_TIME.DEFAULT)TppUiCommand.DispTipsGuide(n)TppUiCommand.SeekTips(n)local e=TppTutorial.TipsGuideRadioList[e]if e then
TppTutorial.PlayRadio(e)end
end
function e.IsEnableToShowGuide(e)if TppUiCommand.IsMbDvcTerminalOpened()then
return false
end
if not e then
if TppRadioCommand.IsPlayingRadio()then
return false
end
end
if TppDemo.IsNotPlayable()then
return false
end
return true
end
function e.OpenTips(n)if type(n)~="string"then
return
end
local n=TppDefine.TIPS_ON_STORY[n]local n=TppDefine.TIPS_ON_STORY_LANG_ID_LIST[n]e.RegisterTips(n)end
function e.RegisterTips(e,n)if type(e)=="string"then
local i="tips_name_"..e
TppUiCommand.DeleteTips(e)TppUiCommand.RegistTipsTitle(e,i)if not n then
local n="tips_info_"..e
TppUiCommand.RegistTipsDoc(e,n)end
elseif type(e)=="table"then
local i="tips_name_"..e[1]TppUiCommand.DeleteTips(e[1])TppUiCommand.RegistTipsTitle(e[1],i)if not n then
for i,n in pairs(e)do
local n="tips_info_"..n
TppUiCommand.RegistTipsDoc(e[1],n)end
end
end
end
function e.StartDisplayTimer(e)if not i(e)then
return
end
if not e.svarsName then
return
end
local i=e.svarsName
local n=svars[i]if not n then
return
end
if n<0 then
return
end
local e=e.cautionTimeSec or 30
mvars.ui_displayTimeSecSvarsName=i
TppUiStatusManager.SetStatus("DisplayTimer","NO_TIMECOUNT_SUB")TppUiStatusManager.UnsetStatus("DisplayTimer","NO_TIMECOUNT")TppUiCommand.StartDisplayTimer(n,e)end
function e.ShowSavingIcon()TppUiCommand.CallSaveMessage()end
function e.ShowLoadingIcon()TppUiCommand.CallLoadMessage()end
function e.ShowAccessIcon()TppUiCommand.CallAccessMessage()end
function e.ShowAccessIconContinue()TppUiCommand.CallAccessContinueMessage()end
function e.HideAccessIcon()TppUiCommand.HideAccessMessage()end
function e.ShowTextureLogo()TppUiCommand.ShowTextureLogo()end
function e.HideTextureLogo()TppUiCommand.HideTextureLogo()end
function e.ShowCallSupportBuddyAnnounceLog()local n=e.BUDDY_LANG_ID[mvars.ui_callSupportBuddyType]if n then
local i=TppSupportRequest.GetCallBuddyGmpCost(mvars.ui_callSupportBuddyType)e.ShowAnnounceLog("callSupportBuddyReceived",n)TppTerminal.UpdateGMP{gmp=-i,gmpCostType=TppDefine.GMP_COST_TYPE.BUDDY}svars.supportGmpCost=svars.supportGmpCost+i
mvars.ui_callSupportBuddyType=nil
end
end
function e.SetSupportCallBuddyType(e)mvars.ui_callSupportBuddyType=e
end
function e.StartLoadingTips()TppUiCommand.StartLoadingTipsCommon()end
function e.FinishLoadingTips()TppUiCommand.RequestEndLoadingTips()end
function e.StartLyricOkb(e)TppUiCommand.LyricTexture("disp","okb_lyric_15",5.5,1.43)TppUiCommand.LyricTexture("disp","okb_lyric_16",6,.23)TppUiCommand.LyricTexture("disp","okb_lyric_17",6.75,.38)TppUiCommand.LyricTexture("disp","okb_lyric_18",2.47,.17)TppUiCommand.LyricTexture("disp","okb_lyric_19",7.2,.33)TppUiCommand.LyricTexture("disp","okb_lyric_20",7.03,2.02)TppUiCommand.LyricTexture("disp","okb_lyric_21",4.12,.17)TppUiCommand.LyricTexture("disp","okb_lyric_22",3.4,.27)TppUiCommand.LyricTexture("disp","okb_lyric_23",3.2,.3)TppUiCommand.LyricTexture("disp","okb_lyric_24",3.03,.3)TppUiCommand.LyricTexture("disp","okb_lyric_25",6.9,.07)TppUiCommand.LyricTexture("disp","okb_lyric_26",7.33,6.23)TppUiCommand.LyricTexture("disp","okb_lyric_27",6.43,.2)TppUiCommand.LyricTexture("disp","okb_lyric_28",3.73,0)TppUiCommand.LyricTexture("start",e)end
function e.StartLyricEnding(e)TppUiCommand.LyricTexture("disp","okb_lyric_01",5.83,.53)TppUiCommand.LyricTexture("disp","okb_lyric_02",6.43,.47)TppUiCommand.LyricTexture("disp","okb_lyric_03",6.73,.33)TppUiCommand.LyricTexture("disp","okb_lyric_04",7.9,(2.57+101.85))TppUiCommand.LyricTexture("disp","okb_lyric_19",6.8,.3)TppUiCommand.LyricTexture("disp","okb_lyric_10",6.23,.33)TppUiCommand.LyricTexture("disp","okb_lyric_11",6.47,.27)TppUiCommand.LyricTexture("disp","okb_lyric_12",2.9,.23)TppUiCommand.LyricTexture("disp","okb_lyric_13",3.5,.33)TppUiCommand.LyricTexture("disp","okb_lyric_14",5.07,26.93)TppUiCommand.LyricTexture("disp","okb_lyric_15",5.5,1.43)TppUiCommand.LyricTexture("disp","okb_lyric_16",6,.23)TppUiCommand.LyricTexture("disp","okb_lyric_17",6.75,.38)TppUiCommand.LyricTexture("disp","okb_lyric_18",2.47,.17)TppUiCommand.LyricTexture("disp","okb_lyric_19",7.2,.33)TppUiCommand.LyricTexture("disp","okb_lyric_20",7.03,2.02)TppUiCommand.LyricTexture("disp","okb_lyric_21",4.12,.17)TppUiCommand.LyricTexture("disp","okb_lyric_22",3.4,.27)TppUiCommand.LyricTexture("disp","okb_lyric_23",3.2,.3)TppUiCommand.LyricTexture("disp","okb_lyric_24",3.03,.3)TppUiCommand.LyricTexture("disp","okb_lyric_25",6.9,.07)TppUiCommand.LyricTexture("disp","okb_lyric_26",7.33,6.23)TppUiCommand.LyricTexture("disp","okb_lyric_27",6.43,.2)TppUiCommand.LyricTexture("disp","okb_lyric_28",3.73,0)TppUiCommand.LyricTexture("start",e)end
function e.StartLyricQuiet(e)TppUiCommand.LyricTexture("disp","quiet_lyric_01",2.05,1.53)TppUiCommand.LyricTexture("disp","quiet_lyric_02",3.83,1.57)TppUiCommand.LyricTexture("disp","quiet_lyric_03",2.8,.8)TppUiCommand.LyricTexture("disp","quiet_lyric_04",5.03,1.57)TppUiCommand.LyricTexture("disp","quiet_lyric_05",2.23,1.3)TppUiCommand.LyricTexture("disp","quiet_lyric_06",3.53,1.3)TppUiCommand.LyricTexture("disp","quiet_lyric_07",2.4,2.47)TppUiCommand.LyricTexture("disp","quiet_lyric_08",4.53,1.37)TppUiCommand.LyricTexture("disp","quiet_lyric_09",2.33,1.23)TppUiCommand.LyricTexture("disp","quiet_lyric_10",3.47,1.37)TppUiCommand.LyricTexture("disp","quiet_lyric_11",2.7,1.9)TppUiCommand.LyricTexture("disp","quiet_lyric_12",3.8,2.17)TppUiCommand.LyricTexture("disp","quiet_lyric_13",2.53,.2)TppUiCommand.LyricTexture("disp","quiet_lyric_14",4.43,1)TppUiCommand.LyricTexture("disp","quiet_lyric_15",3.23,1.7)TppUiCommand.LyricTexture("disp","quiet_lyric_16",4.9,1.47)TppUiCommand.LyricTexture("disp","quiet_lyric_17",3.27,1.17)TppUiCommand.LyricTexture("disp","quiet_lyric_18",4.23,.25)TppUiCommand.LyricTexture("disp","quiet_lyric_19",4.02,.37)TppUiCommand.LyricTexture("disp","quiet_lyric_20",4.93,.2)TppUiCommand.LyricTexture("disp","quiet_lyric_21",4.73,.2)TppUiCommand.LyricTexture("disp","quiet_lyric_22",4.4,.37)TppUiCommand.LyricTexture("disp","quiet_lyric_23",4.63,.03)TppUiCommand.LyricTexture("disp","quiet_lyric_24",3.13,1.53)TppUiCommand.LyricTexture("disp","quiet_lyric_25",4.73,.33)TppUiCommand.LyricTexture("disp","quiet_lyric_26",4.23,.67)TppUiCommand.LyricTexture("disp","quiet_lyric_27",4.53,.1)TppUiCommand.LyricTexture("disp","quiet_lyric_28",6.63,0)TppUiCommand.LyricTexture("start",e)end
function e.StartLyricCyprus(e)TppUiCommand.LyricTexture("disp","cyprus_lyric_01",7.87,.57)TppUiCommand.LyricTexture("disp","cyprus_lyric_02",7.93,.53)TppUiCommand.LyricTexture("disp","cyprus_lyric_03",7.5,0)TppUiCommand.LyricTexture("disp","cyprus_lyric_04",8.47,2.07)TppUiCommand.LyricTexture("disp","cyprus_lyric_05",3.7,.53)TppUiCommand.LyricTexture("disp","cyprus_lyric_06",3.7,.43)TppUiCommand.LyricTexture("disp","cyprus_lyric_07",3.8,.43)TppUiCommand.LyricTexture("disp","cyprus_lyric_08",4,12.03)TppUiCommand.LyricTexture("disp","cyprus_lyric_09",7.4,1.13)TppUiCommand.LyricTexture("disp","cyprus_lyric_10",7.93,.53)TppUiCommand.LyricTexture("disp","cyprus_lyric_11",7.3,0)TppUiCommand.LyricTexture("disp","cyprus_lyric_12",8.6,2)TppUiCommand.LyricTexture("disp","cyprus_lyric_13",3.73,.57)TppUiCommand.LyricTexture("disp","cyprus_lyric_14",3.6,.5)TppUiCommand.LyricTexture("disp","cyprus_lyric_15",3.83,.43)TppUiCommand.LyricTexture("disp","cyprus_lyric_16",4.73,5.93)TppUiCommand.LyricTexture("disp","cyprus_lyric_17",3.73,.6)TppUiCommand.LyricTexture("disp","cyprus_lyric_18",3.63,.4)TppUiCommand.LyricTexture("disp","cyprus_lyric_19",3.83,.43)TppUiCommand.LyricTexture("disp","cyprus_lyric_20",4.27,0)TppUiCommand.LyricTexture("start",e)end
function e.OnAllocate(n)if n.sequence then
if n.sequence.OVERRIDE_SYSTEM_EXCEPT_GAME_STATUS then
mvars.ui_onEndFadeInOverrideExceptGameStatus=n.sequence.OVERRIDE_SYSTEM_EXCEPT_GAME_STATUS
end
end
local i=true
if n.sequence and n.sequence.NO_LOAD_UI_DEFAULT_BLOCK then
i=false
end
if i then
e.LoadAndWaitUiDefaultBlock()else
return
end
TppUiCommand.ClearAllMissionPhotoIds()if n.sequence and n.sequence.UNSET_UI_SETTING then
mvars.ui_unsetUiSetting=n.sequence.UNSET_UI_SETTING
end
if TppMission.IsMissionStart()then
e.EnableMissionSubGoal(u)end
if TppUiCommand.InitAllEnemyRoutePoints then
TppUiCommand.InitAllEnemyRoutePoints()end
TppUiCommand.ClearIconUniqueInformation()end
function e.LoadAndWaitUiDefaultBlock()TppUiCommand.LoadUiDefaultBlock()local e=0
local e,i=0,25
local n=false
n=not TppUiCommand.IsTppUiReady()while n and(e<i)do
n=not TppUiCommand.IsTppUiReady()e=e+Time.GetFrameTime()coroutine.yield()end
end
function e.OnMissionStart()local e=vars.missionCode
local n=TppMission.IsHelicopterSpace(e)if n then
return
end
local e=TppMission.IsFreeMission(e)if e then
return
end
TppUiCommand.RemovedAllUserMarker()end
function e.Init()e.messageExecTable=Tpp.MakeMessageExecTable(e.Messages())TppUiCommand.SetMotherBaseStageSecurityTable{numInSpecialPlatform=TppDefine.SECURITY_SETTING.numInSpecialPlatform,numInCommonPlatform=TppDefine.SECURITY_SETTING.numInCommonPlatform,numInCommandPlatform=TppDefine.SECURITY_SETTING.numInCommandPlatform,numInBaseDevPlatform=TppDefine.SECURITY_SETTING.numInBaseDevPlatform}local a=TppMission.IsHelicopterSpace(vars.missionCode)local t=TppMission.IsFreeMission(vars.missionCode)local n=TppMission.IsFOBMission(vars.missionCode)if a or t then
TppUiCommand.HideOuterZone()else
TppUiCommand.ShowOuterZone()end
if a then
TppUiStatusManager.SetStatus("MbEquipDevelop","NO_OPEN_SUPPORT_DIALOG")else
TppUiStatusManager.UnsetStatus("MbEquipDevelop","NO_OPEN_SUPPORT_DIALOG")end
if TppMission.IsCanMissionClear()then
TppUiCommand.ShowHotZone()else
TppUiCommand.HideHotZone()end
TppUiCommand.ResetCurrentMissionSubGoalNo()e._RegisterDefaultLandPoint()local i=(UiCommonDataManager.GetInstance()~=nil)if i then
if a then
e.RegisterHeliSpacePauseMenuPage(true)elseif t then
local e={GamePauseMenu.RESTART_FROM_CHECK_POINT,GamePauseMenu.RETURN_TO_TITLE,GamePauseMenu.SIGN_IN,GamePauseMenu.STORE_ITEM,GamePauseMenu.RECORDS_ITEM,GamePauseMenu.CONTROLS_AND_TIPS_ITEM,GamePauseMenu.OPEN_OPTION_MENU}if TppMission.IsMbFreeMissions(vars.missionCode)then
if(vars.missionCode==30050)then
table.insert(e,2,GamePauseMenu.RESTART_FROM_MISSION_START)end
else
table.insert(e,2,GamePauseMenu.RESTART_FROM_HELICOPTER)end
TppUiCommand.RegisterPauseMenuPage(e)elseif TppMission.IsEmergencyMission()then
if n then
TppUiCommand.RegisterPauseMenuPage{GamePauseMenu.RETURN_TO_MISSION_FROM_EMERGENCY_MISSION}else
TppUiCommand.RegisterPauseMenuPage{GamePauseMenu.RETURN_TO_MISSION_FROM_EMERGENCY_MISSION,GamePauseMenu.SIGN_IN,GamePauseMenu.STORE_ITEM,GamePauseMenu.RECORDS_ITEM,GamePauseMenu.CONTROLS_AND_TIPS_ITEM,GamePauseMenu.OPEN_OPTION_MENU}end
elseif n then
e.RegisterFobSneakPauseMenuPage()else
local e={GamePauseMenu.RESTART_FROM_MISSION_START,GamePauseMenu.RETURN_TO_TITLE,GamePauseMenu.SIGN_IN,GamePauseMenu.STORE_ITEM,GamePauseMenu.CONTROLS_AND_TIPS_ITEM,GamePauseMenu.OPEN_OPTION_MENU}if gvars.str_storySequence>=TppDefine.STORY_SEQUENCE.CLEARD_TO_MATHER_BASE then
table.insert(e,6,GamePauseMenu.RECORDS_ITEM)end
if TppMission.IsStartFromHelispace()then
table.insert(e,3,GamePauseMenu.ABORT_MISSION_RETURN_TO_ACC)end
if TppMission.IsStartFromFreePlay()then
table.insert(e,3,GamePauseMenu.ABORT_MISSION)end
if vars.missionCode~=10115 then
table.insert(e,1,GamePauseMenu.RESTART_FROM_CHECK_POINT)end
TppUiCommand.RegisterPauseMenuPage(e)end
local e=false
if n then
e=true
end
TppPauseMenu.SetIgnoreActorPause(e)end
if i then
if t then
local e={GameOverMenu.GAME_OVER_CONTINUE,GameOverMenu.GAME_OVER_TITLE}if vars.missionCode~=30050 then
table.insert(e,2,GameOverMenu.GAME_OVER_RESTART_HELI)end
TppUiCommand.RegisterGameOverMenuItems(e)elseif TppMission.IsEmergencyMission()then
TppUiCommand.RegisterGameOverMenuItems{GameOverMenu.GAME_OVER_RETURN_TO_MISSION}elseif n then
e.RegisterFobSneakGameOverMenuItems()else
local e={GameOverMenu.GAME_OVER_RESTART,GameOverMenu.GAME_OVER_TITLE}if TppMission.IsStartFromHelispace()then
table.insert(e,3,GameOverMenu.GAME_OVER_ABORT_RETURN_TO_ACC)end
if TppMission.IsStartFromFreePlay()then
table.insert(e,3,GameOverMenu.GAME_OVER_ABORT)end
if vars.missionCode~=10115 then
table.insert(e,1,GameOverMenu.GAME_OVER_CONTINUE)end
TppUiCommand.RegisterGameOverMenuItems(e)end
end
if i then
TppUiCommand.RegisterSideOpsListFunction("TppQuest","GetSideOpsListTable")end
TppUiCommand.SetMBMapArrowIcon(false)GameConfig.ApplyAllConfig()TppUiCommand.EraseDisplayTimer()TppUiCommand.ResetCpNameBaseLangId()if TppUiCommand.RegistCpNameBaseLangId and mvars.loc_locationBaseTelop then
for n,e in ipairs(mvars.loc_locationBaseTelop.cpLangIdTable)do
local n,i,e=e[1],e[2],e[3]TppUiCommand.RegistCpNameBaseLangId(n,i,e)end
end
TppUiCommand.RegistCpNameBaseLangId("helicopterSpace","tpp_heli_acc")TppUiCommand.ClearAllMissionTask()TppUiStatusManager.UnsetStatus("EquipHudAll","ALL_KILL_NOUSE")TppUiStatusManager.UnsetStatus("QuestAreaAnnounce","INVALID")TppUiStatusManager.UnsetStatus("SideFobInfo","INVALID")TppUiCommand.SetupMapIconRadiusMeters{radiusTable={0,30,40,62.5,125,200,325,450,600,1200}}if TppStory.IsAlwaysOpenRetakeThePlatform()then
TppUiCommand.SetMission10115Emergency(false)else
TppUiCommand.SetMission10115Emergency(true)end
TppUiCommand.HidePictureInfoHud()TppUiCommand.RegisterMemorialMission{10010,10030,10240}if TppStory.IsMissionCleard(10260)then
TppUiCommand.SetMissionNameStatus{missionId=10260,type="REPLAY"}TppUiCommand.SetMissionNameStatus{missionId=10050,type="REPLAY"}else
TppUiCommand.SetMissionNameStatus{missionId=10050,type="DEFAULT"}TppUiCommand.SetMissionNameStatus{missionId=10260,type="DEFAULT"}end
TppUiCommand.SetMissionNameStatus{missionId=10070,type="DEFAULT"}TppUiCommand.SetMissionNameStatus{missionId=10120,type="DEFAULT"}if TppDemo.IsPlayedMBEventDemo"TheGreatEscapeLiquid"then
TppUiCommand.SetMissionNameStatus{missionId=10120,type="REPLAY"}end
if TppDemo.IsPlayedMBEventDemo"DecisionHuey"then
TppUiCommand.SetMissionNameStatus{missionId=10070,type="REPLAY"}end
if TppUiCommand.SetMotherBaseInfoPhotoParameters~=nil then
TppUiCommand.SetMotherBaseInfoPhotoParameters{battleGearDevelopLevel=TppStory.GetBattleGearDevelopLevel(),isEnableSahelan=TppStory.CanArrivalSahelanInMB()}end
end
function e.RegisterHeliSpacePauseMenuPage(n)local e={GamePauseMenu.RETURN_TO_TITLE,GamePauseMenu.ONLINE_NEWS,GamePauseMenu.RECORDS_ITEM,GamePauseMenu.CONTROLS_AND_TIPS_ITEM,GamePauseMenu.OPEN_OPTION_MENU,GamePauseMenu.GOTO_MGO}if n then
table.insert(e,2,GamePauseMenu.STORE_ITEM)end
if not(TppGameMode.GetUserMode()<=TppGameMode.U_SIGN_OUT)then
table.insert(e,2,GamePauseMenu.SIGN_IN)end
TppUiCommand.RegisterPauseMenuPage(e)end
function e.RegisterFobSneakPauseMenuPage()local e={GamePauseMenu.ABORT_MISSION_RETURN_TO_ACC}if(vars.fobSneakMode==FobMode.MODE_SHAM)and(TppNetworkUtil.GetSessionMemberCount()==1)then
table.insert(e,1,GamePauseMenu.RESTART_FROM_MISSION_START)end
TppUiCommand.RegisterPauseMenuPage(e)end
function e.RegisterFobSneakGameOverMenuItems()local e={GameOverMenu.GAME_OVER_ABORT}if(vars.fobSneakMode==FobMode.MODE_SHAM)and(TppNetworkUtil.GetSessionMemberCount()==1)then
table.insert(e,1,GameOverMenu.GAME_OVER_RESTART)end
TppUiCommand.RegisterGameOverMenuItems(e)end
function e.OnReload()e.Init()end
function e.OnMessage(p,s,a,o,t,i,n)Tpp.DoMessage(e.messageExecTable,TppMission.CheckMessageOption,p,s,a,o,t,i,n)end
function e.DisableGameStatusOnFade(n)local e={S_DISABLE_NPC=false}if i(n)then
for n,i in pairs(n)do
e[n]=i
end
end
Tpp.SetGameStatus{target="all",enable=false,except=e,scriptName="TppUI.lua"}end
function e.DisableGameStatusOnFadeOutEnd()Tpp.SetGameStatus{target="all",enable=false,scriptName="TppUI.lua"}end
function e.EnableGameStatusOnFadeInStart()Tpp.SetGameStatus{target={S_DISABLE_NPC=true,S_DISABLE_NPC_NOTICE=true,S_DISABLE_TARGET=true,S_DISABLE_PLAYER_PAD=true,S_DISABLE_PLAYER_DAMAGE=true,S_DISABLE_THROWING=true,S_DISABLE_PLACEMENT=true},enable=true,scriptName="TppUI.lua"}end
function e.EnableGameStatusOnFade()local e,n
if i(mvars.ui_onEndFadeInExceptGameStatus)then
n=mvars.ui_onEndFadeInExceptGameStatus
elseif i(mvars.ui_onEndFadeInOverrideExceptGameStatusTemporary)then
n=mvars.ui_onEndFadeInOverrideExceptGameStatusTemporary
else
if TppDemo.IsNotPlayable()then
e=e or{}for n,i in pairs(TppDefine.UI_STATUS_TYPE_ALL)do
e[n]=false
end
e.PauseMenu=nil
e.InfoTypingText=nil
end
end
if n then
e={}for n,i in pairs(n)do
e[n]=i
end
end
Tpp.SetGameStatus{target="all",enable=true,except=e,scriptName="TppUI.lua"}end
function e._RegisterDefaultLandPoint()local e=TppDefine.DEFAULT_DROP_ROUTE
for n,e in pairs(e)do
if e then
TppUiCommand.RegisterDefaultLandPoint{missionId=n,routeId=e}end
end
end
return e