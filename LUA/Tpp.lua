local e={}local a=Fox.StrCode32
local t=type
local I=GameObject.GetGameObjectId
local d=GameObject.GetTypeIndex
local m=TppGameObject.GAME_OBJECT_TYPE_PLAYER2
local S=TppGameObject.GAME_OBJECT_TYPE_SOLDIER2
local G=TppGameObject.GAME_OBJECT_TYPE_COMMAND_POST2
local n=TppGameObject.GAME_OBJECT_TYPE_HOSTAGE2
local n=TppGameObject.GAME_OBJECT_TYPE_HOSTAGE_UNIQUE
local n=TppGameObject.GAME_OBJECT_TYPE_HOSTAGE_UNIQUE2
local A=TppGameObject.GAME_OBJECT_TYPE_HELI2
local _=TppGameObject.GAME_OBJECT_TYPE_ENEMY_HELI
local b=TppGameObject.GAME_OBJECT_TYPE_HORSE2
local h=TppGameObject.GAME_OBJECT_TYPE_VEHICLE
local O=TppGameObject.GAME_OBJECT_TYPE_WALKERGEAR2
local C=TppGameObject.GAME_OBJECT_TYPE_COMMON_WALKERGEAR2
local P=TppGameObject.GAME_OBJECT_TYPE_VOLGIN2
local U=TppGameObject.GAME_OBJECT_TYPE_MARKER2_LOCATOR
local D=TppGameObject.GAME_OBJECT_TYPE_BOSSQUIET2
local g=TppGameObject.GAME_OBJECT_TYPE_PARASITE2
local M=TppGameObject.GAME_OBJECT_TYPE_SECURITYCAMERA2
local B=TppGameObject.GAME_OBJECT_TYPE_UAV
local L=TppGameObject.PHASE_ALERT
local p=GameObject.NULL_ID
local n=bit.bnot
local n,n,n=bit.band,bit.bor,bit.bxor
e.requires={"/Assets/tpp/script/lib/TppDefine.lua","/Assets/tpp/script/lib/TppMath.lua","/Assets/tpp/script/lib/TppSave.lua","/Assets/tpp/script/lib/TppLocation.lua","/Assets/tpp/script/lib/TppSequence.lua","/Assets/tpp/script/lib/TppWeather.lua","/Assets/tpp/script/lib/TppDbgStr32.lua","/Assets/tpp/script/lib/TppDebug.lua","/Assets/tpp/script/lib/TppClock.lua","/Assets/tpp/script/lib/TppUI.lua","/Assets/tpp/script/lib/TppResult.lua","/Assets/tpp/script/lib/TppSound.lua","/Assets/tpp/script/lib/TppTerminal.lua","/Assets/tpp/script/lib/TppMarker.lua","/Assets/tpp/script/lib/TppRadio.lua","/Assets/tpp/script/lib/TppPlayer.lua","/Assets/tpp/script/lib/TppHelicopter.lua","/Assets/tpp/script/lib/TppScriptBlock.lua","/Assets/tpp/script/lib/TppMission.lua","/Assets/tpp/script/lib/TppStory.lua","/Assets/tpp/script/lib/TppDemo.lua","/Assets/tpp/script/lib/TppEnemy.lua","/Assets/tpp/script/lib/TppGeneInter.lua","/Assets/tpp/script/lib/TppInterrogation.lua","/Assets/tpp/script/lib/TppGimmick.lua","/Assets/tpp/script/lib/TppMain.lua","/Assets/tpp/script/lib/TppDemoBlock.lua","/Assets/tpp/script/lib/TppAnimalBlock.lua","/Assets/tpp/script/lib/TppCheckPoint.lua","/Assets/tpp/script/lib/TppPackList.lua","/Assets/tpp/script/lib/TppQuest.lua","/Assets/tpp/script/lib/TppTrap.lua","/Assets/tpp/script/lib/TppReward.lua","/Assets/tpp/script/lib/TppRevenge.lua","/Assets/tpp/script/lib/TppReinforceBlock.lua","/Assets/tpp/script/lib/TppEneFova.lua","/Assets/tpp/script/lib/TppFreeHeliRadio.lua","/Assets/tpp/script/lib/TppHero.lua","/Assets/tpp/script/lib/TppTelop.lua","/Assets/tpp/script/lib/TppRatBird.lua","/Assets/tpp/script/lib/TppMovie.lua","/Assets/tpp/script/lib/TppAnimal.lua","/Assets/tpp/script/lib/TppException.lua","/Assets/tpp/script/lib/TppTutorial.lua","/Assets/tpp/script/lib/TppLandingZone.lua","/Assets/tpp/script/lib/TppCassette.lua","/Assets/tpp/script/lib/TppEmblem.lua","/Assets/tpp/script/lib/TppDevelopFile.lua","/Assets/tpp/script/lib/TppPaz.lua","/Assets/tpp/script/lib/TppRanking.lua","/Assets/tpp/script/lib/TppTrophy.lua","/Assets/tpp/script/lib/TppMbFreeDemo.lua"}function e.IsTypeFunc(e)return t(e)=="function"end
local f=e.IsTypeFunc
function e.IsTypeTable(e)return t(e)=="table"end
local i=e.IsTypeTable
function e.IsTypeString(e)return t(e)=="string"end
local n=e.IsTypeString
function e.IsTypeNumber(e)return t(e)=="number"end
local n=e.IsTypeNumber
function e.Enum(e)if e==nil then
return
end
if#e==0 then
return e
end
for n=1,#e do
e[e[n]]=n
end
return e
end
function e.IsMaster()do
return true
end
end
function e.IsQARelease()return(Fox.GetDebugLevel()==Fox.DEBUG_LEVEL_QA_RELEASE)end
function e.SplitString(e,r)local t={}local n
local e=e
while true do
n=string.find(e,r)if(n==nil)then
table.insert(t,e)break
else
local r=string.sub(e,0,n-1)table.insert(t,r)e=string.sub(e,n+1)end
end
return t
end
function e.StrCode32Table(n)local r={}for n,l in pairs(n)do
local n=n
if t(n)=="string"then
n=a(n)end
if t(l)=="table"then
r[n]=e.StrCode32Table(l)else
r[n]=l
end
end
return r
end
function e.ApendArray(e,n)for t,n in pairs(n)do
e[#e+1]=n
end
end
function e.MergeTable(r,n,e)local e=r
for n,t in pairs(n)do
if r[n]==nil then
e[n]=t
else
e[n]=t
end
end
return e
end
function e.BfsPairs(l)local a,r,t={l},1,1
local function p(n,e)local n,e=e,nil
while true do
n,e=next(a[r],n)if i(e)then
t=t+1
a[t]=e
end
if n then
return n,e
else
r=r+1
if r>t then
return
end
end
end
end
return p,l,nil
end
e._DEBUG_svars={}e._DEBUG_gvars={}function e.MakeMessageExecTable(e)if e==nil then
return
end
if next(e)==nil then
return
end
local n={}local T=a"msg"local d=a"func"local c=a"sender"local E=a"option"for e,r in pairs(e)do
n[e]=n[e]or{}for r,l in pairs(r)do
local r,s,u,o=r,nil,nil,nil
if f(l)then
u=l
elseif i(l)and f(l[d])then
r=a(l[T])local n={}if(t(l[c])=="string")or(t(l[c])=="number")then
n[1]=l[c]elseif i(l[c])then
n=l[c]end
s={}for r,n in pairs(n)do
if t(n)=="string"then
if e==a"GameObject"then
s[r]=I(n)if msgSndr==p then
end
else
s[r]=a(n)end
elseif t(n)=="number"then
s[r]=n
end
end
u=l[d]o=l[E]end
if u then
n[e][r]=n[e][r]or{}if next(s)~=nil then
for l,t in pairs(s)do
n[e][r].sender=n[e][r].sender or{}n[e][r].senderOption=n[e][r].senderOption or{}if n[e][r].sender[t]then
end
n[e][r].sender[t]=u
if o and i(o)then
n[e][r].senderOption[t]=o
end
end
else
if n[e][r].func then
end
n[e][r].func=u
if o and i(o)then
n[e][r].option=o
end
end
end
end
end
return n
end
function e.DoMessage(n,a,p,i,t,r,l,o,s)if not n then
return
end
local n=n[p]if not n then
return
end
local n=n[i]if not n then
return
end
local i=true
e.DoMessageAct(n,a,t,r,l,o,s,i)end
function e.DoMessageAct(e,a,n,l,r,i,t)if e.func then
if a(e.option)then
e.func(n,l,r,i)end
end
local t=e.sender
if t and t[n]then
if a(e.senderOption[n])then
t[n](n,l,r,i)end
end
end
function e.GetRotationY(e)if not e then
return
end
if(t(e.Rotate)=="function")then
local e=e:Rotate(Vector3(0,0,1))local e=foxmath.Atan2(e:GetX(),e:GetZ())return TppMath.RadianToDegree(e)end
end
function e.GetLocator(t,n)local n,t=e.GetLocatorByTransform(t,n)if n~=nil then
return TppMath.Vector3toTable(n),e.GetRotationY(t)else
return nil
end
end
function e.GetLocatorByTransform(t,n)local e=e.GetDataWithIdentifier(t,n,"TransformData")if e==nil then
return
end
local e=e.worldTransform
return e.translation,e.rotQuat
end
function e.GetDataWithIdentifier(e,n,t)local e=DataIdentifier.GetDataWithIdentifier(e,n)if e==NULL then
return
end
if(e:IsKindOf(t)==false)then
return
end
return e
end
function e.GetDataBodyWithIdentifier(t,e,n)local e=DataIdentifier.GetDataBodyWithIdentifier(t,e)if(e.data==nil)then
return
end
if(e.data:IsKindOf(n)==false)then
return
end
return e
end
function e.SetGameStatus(n)if not i(n)then
return
end
local t=n.enable
local r=n.scriptName
local e=n.target
local n=n.except
if t==nil then
return
end
if e=="all"then
e={}for t,n in pairs(TppDefine.UI_STATUS_TYPE_ALL)do
e[t]=n
end
for t,n in pairs(TppDefine.GAME_STATUS_TYPE_ALL)do
e[t]=n
end
elseif i(e)then
e=e
else
return
end
if i(n)then
for t,n in pairs(n)do
e[t]=n
end
end
if t then
for n,t in pairs(TppDefine.GAME_STATUS_TYPE_ALL)do
if e[n]then
TppGameStatus.Reset(r,n)end
end
for n,t in pairs(TppDefine.UI_STATUS_TYPE_ALL)do
local t=e[n]local e=mvars.ui_unsetUiSetting
if i(e)and e[n]then
TppUiStatusManager.UnsetStatus(n,e[n])else
if t then
TppUiStatusManager.ClearStatus(n)end
end
end
else
for n,t in pairs(TppDefine.UI_STATUS_TYPE_ALL)do
local e=e[n]if e then
TppUiStatusManager.SetStatus(n,e)else
TppUiStatusManager.ClearStatus(n)end
end
for n,t in pairs(TppDefine.GAME_STATUS_TYPE_ALL)do
local e=e[n]if e then
TppGameStatus.Set(r,n)end
end
end
end
function e.GetAllDisableGameStatusTable()local e={}for n,t in pairs(TppDefine.UI_STATUS_TYPE_ALL)do
e[n]=false
end
for n,t in pairs(TppDefine.GAME_STATUS_TYPE_ALL)do
e[n]=false
end
return e
end
function e.GetHelicopterStartExceptGameStatus()local e={}e.EquipPanel=false
e.AnnounceLog=false
e.HeadMarker=false
e.WorldMarker=false
return e
end
local function n(e,n)if e==nil then
return
end
if e==p then
return
end
local e=d(e)if e==n then
return true
else
return false
end
end
function e.IsPlayer(e)return n(e,m)end
function e.IsLocalPlayer(e)if e==PlayerInfo.GetLocalPlayerIndex()then
return true
else
return false
end
end
function e.IsSoldier(e)return n(e,S)end
function e.IsCommandPost(e)return n(e,G)end
function e.IsHostage(e)if e==nil then
return
end
if e==p then
return
end
local e=d(e)return TppDefine.HOSTAGE_GM_TYPE[e]end
function e.IsVolgin(e)return n(e,P)end
function e.IsHelicopter(e)return n(e,A)end
function e.IsEnemyHelicopter(e)return n(e,_)end
function e.IsHorse(e)return n(e,b)end
function e.IsVehicle(e)return n(e,h)end
function e.IsPlayerWalkerGear(e)return n(e,O)end
function e.IsEnemyWalkerGear(e)return n(e,C)end
function e.IsFultonContainer(e)return n(e,TppGameObject.GAME_OBJECT_TYPE_FULTONABLE_CONTAINER)end
function e.IsFultonableGimmick(e)if e==nil then
return
end
if e==p then
return
end
local e=d(e)return TppDefine.FULTONABLE_GIMMICK_TYPE[e]end
function e.GetBuddyTypeFromGameObjectId(e)if e==nil then
return
end
if e==p then
return
end
local e=d(e)return TppDefine.BUDDY_GM_TYPE_TO_BUDDY_TYPE[e]end
function e.IsMarkerLocator(e)return n(e,U)end
function e.IsAnimal(e)if e==nil then
return
end
if e==p then
return
end
local e=d(e)return TppDefine.ANIMAL_GAMEOBJECT_TYPE[e]end
function e.IsBossQuiet(e)return n(e,D)end
function e.IsParasiteSquad(e)return n(e,g)end
function e.IsSecurityCamera(e)return n(e,M)end
function e.IsGunCamera(e)if e==p then
return false
end
local t={id="IsGunCamera"}local n=false
n=GameObject.SendCommand(e,t)return n
end
function e.IsUAV(e)return n(e,B)end
function e.IncrementPlayData(e)if gvars[e]==nil then
return
end
if gvars[e]<TppDefine.MAX_32BIT_UINT then
gvars[e]=gvars[e]+1
end
end
function e.IsNotAlert()if vars.playerPhase<L then
return true
else
return false
end
end
function e.IsPlayerStatusNormal()local e=vars
if e.playerLife>0 and e.playerStamina>0 then
return true
else
return false
end
end
function e.AreaToIndices(e)local n,t,l,r=e[1],e[2],e[3],e[4]local e={}for l=n,l do
for n=t,r do
table.insert(e,{l,n})end
end
return e
end
function e.CheckBlockArea(e,n,t)local i,l,r,e=e[1],e[2],e[3],e[4]if(((n>=i)and(n<=r))and(t>=l))and(t<=e)then
return true
end
return false
end
function e.FillBlockArea(e,n,i,l,r,t)for n=n,l do
e[n]=e[n]or{}for r=i,r do
e[n][r]=t
end
end
end
function e.GetCurrentStageSmallBlockIndex()local e=2
local n,t=StageBlock.GetCurrentMinimumSmallBlockIndex()return(n+e),(t+e)end
function e.IsLoadedSmallBlock(n,t)local r=4
local e,l=StageBlock.GetCurrentMinimumSmallBlockIndex()local i=e+r
local r=e+r
return((e<=n and i>=n)and l<=t)and r>=t
end
function e.IsLoadedLargeBlock(e)local n=a(e)local e=StageBlock.GetLoadedLargeBlocks(0)for t,e in pairs(e)do
if e==n then
return true
end
end
return false
end
function e.GetLoadedLargeBlock()local e=StageBlock.GetLoadedLargeBlocks(0)for n,e in pairs(e)do
return e
end
return nil
end
function e.GetChunkIndex(t,n)local e
if n then
e=Chunk.INDEX_MGO
else
e=TppDefine.LOCATION_CHUNK_INDEX_TABLE[t]if e==nil then
end
return e
end
return e
end
local l=1
local n=0
function e.ShowChunkInstallingPopup(t,r)local e=Time.GetFrameTime()n=n-e
if n>0 then
return
end
n=n+l
if n<0 then
n=0
end
local n=Fox.GetPlatformName()local e=Chunk.GetChunkInstallationEta(t)if e and n=="PS4"then
if e>86400 then
e=86400
end
TppUiCommand.SetErrorPopupParam(e)end
local e=Chunk.GetChunkInstallationRate(t)if e and n=="XboxOne"then
TppUiCommand.SetErrorPopupParam(e*1e4,"None",2)end
local e
if r then
e=Popup.TYPE_ONE_CANCEL_BUTTON
else
TppUiCommand.SetPopupType"POPUP_TYPE_NO_BUTTON_NO_EFFECT"end
TppUiCommand.ShowErrorPopup(TppDefine.ERROR_ID.NOW_INSTALLING,e)end
function e.GetFormatedStorageSizePopupParam(e)local t=1024
local n=1024*t
local r=1024*n
local l,i,r=e/r,e/n,e/t
local t=0
local n=""if l>=1 then
t=l*100
n="G"elseif i>=1 then
t=i*100
n="M"elseif r>=1 then
t=r*100
n="K"else
return e,"",0
end
local e=math.ceil(t)return e,n,2
end
function e.DEBUG_DunmpBlockArea(t,r,e)local n="       "for e=1,e do
n=n..string.format("%02d,",e)end
for r=1,r do
local n=""for e=1,e do
n=n..string.format("%02d,",t[r][e])end
end
end
function e.DEBUG_DumpTable(l,n)if n==nil then
end
if(t(l)~="table")then
return
end
local r=""if n then
for e=0,n do
r=r.." "end
end
for l,r in pairs(l)do
if t(r)=="table"then
local n=n or 0
n=n+1
e.DEBUG_DumpTable(r,n)else
if t(r)=="number"then
end
end
end
end
function e.DEBUG_Where(e)local e=debug.getinfo(e+1)if e then
return e.short_src..(":"..e.currentline)end
return"(unknown)"end
function e.DEBUG_StrCode32ToString(e)if e~=nil then
local n
if(TppDbgStr32)then
n=TppDbgStr32.DEBUG_StrCode32ToString(e)end
if n then
return n
else
if t(e)=="string"then
end
return tostring(e)end
else
return"nil"end
end
function e.DEBUG_Fatal(e,e)end
function e.DEBUG_SetPreference(n,t,r)local n=Preference.GetPreferenceEntity(n)if(n==nil)then
return
end
if(n[t]==nil)then
return
end
Command.SetProperty{entity=n,property=t,value=r}end
e._requireList={}do
for t,n in ipairs(e.requires)do
local n=e.SplitString(n,"/")local n=string.sub(n[#n],1,#n[#n]-4)local t={TppMain=true,TppDemoBlock=true,mafr_luxury_block_list=true}if not t[n]then
e._requireList[#e._requireList+1]=n
end
end
end
return e