local e={}local c=ScriptBlock.GetCurrentScriptBlockId
local t=ScriptBlock.GetScriptBlockState
e.isAllocatedMtbsEnemy=false
function e.OnAllocate()TppScriptBlock.InitScriptBlockState()e.isAllocatedMtbsEnemy=false
if vars.missionCode==30050 then
e.isAllocatedMtbsEnemy=true
mtbs_enemy.OnAllocateDemoBlock()end
end
function e.OnInitialize()end
function e.OnUpdate()local e=c()local t=t(e)if t==ScriptBlock.SCRIPT_BLOCK_STATE_ACTIVE then
TppDemo.PlayOnDemoBlock()return
end
if TppScriptBlock.IsRequestActivate(e)then
TppScriptBlock.ActivateScriptBlockState(e)end
end
function e.OnTerminate()TppDemo.FinalizeOnDemoBlock()TppScriptBlock.FinalizeScriptBlockState()if e.isAllocatedMtbsEnemy then
mtbs_enemy.OnTerminateDemoBlock()end
end
return e