local e={}local n=Fox.StrCode32
local n=Tpp.IsTypeTable
local a=GameObject.GetGameObjectId
local n=GameObject.NULL_ID
local n=GameObject.SendCommand
local n=Tpp.DEBUG_StrCode32ToString
function e._EnableMarkerIcon(e,r,n)TppMarker.Enable(e,r,"none","map_only_icon",0,false,true)if n~=nil then
local e=a(e)TppUiCommand.RegisterIconUniqueInformation{markerId=e,langId=n}end
end
function e.EnableMarker(n,a,r)if n==nil then
return
end
a=a or 0
if Tpp.IsTypeTable(n)then
for t,n in ipairs(n)do
e._EnableMarkerIcon(n,a,r)end
else
e._EnableMarkerIcon(n,a,r)end
TppUI.ShowAnnounceLog"updateMap"end
function e.EnableMarkerGimmick(e)if e==nil then
return
end
if Tpp.IsTypeTable(e)then
for n,e in ipairs(e)do
TppGimmick.EnableMarkerGimmick(e)end
else
TppGimmick.EnableMarkerGimmick(e)end
TppUI.ShowAnnounceLog"updateMap"end
function e.InterCall_enqt1000_1a1110(e,e,e)end
function e.InterCall_enqt1000_1a1010(e,e,e)end
function e.InterCall_cliffTown_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][cliffTown]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_tent_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][tent]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_waterWay_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][waterWay]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.debug_geneInter_powerPlant_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][powerPlant]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_sovietBase_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][sovietBase]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_remnants_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][remnants]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_field_001(n,n,n)e.EnableMarker("TppMarker2Locator_field_sniper01",0,"marker_wep_sniper")end
function e.InterCall_field_002(n,n,n)e.EnableMarker("TppMarker2Locator_field_ammo01",0,"marker_ammo_pri")end
function e.InterCall_field_003(n,n,n)e.EnableMarker("TppMarker2Locator_field_ammo02",0,"marker_ammo_pri")end
function e.InterCall_field_004(n,n,n)e.EnableMarkerGimmick{"field_gun001","field_gun002"}end
function e.InterCall_field_005(n,n,n)e.EnableMarkerGimmick{"field_mortar001","field_mortar002","field_mortar003"}end
function e.InterCall_field_006(n,n,n)e.EnableMarker("TppMarker2Locator_field_trash01",0,"marker_dustbox")end
function e.InterCall_field_007(n,n,n)e.EnableMarker("TppMarker2Locator_field_dia0022",2,"marker_diamond_gem")end
function e.InterCall_field_008(n,n,n)SubtitlesCommand.DisplayText("[dbg][field]『発電機』の位置は……","Default",3e3)e.EnableMarker("TppMarker2Locator_field_generator01",0,"marker_power")end
function e.InterCall_field_009(n,n,n)e.EnableMarker("TppMarker2Locator_field_radio",0,"marker_comm_inst")end
function e.InterCall_citadel_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][citadel]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_fort_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][fort]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_village_001(n,n,n)e.EnableMarkerGimmick{"village_antiair001"}end
function e.InterCall_village_002(n,n,n)e.EnableMarker("TppMarker2Locator_village_ammo01",0,"marker_ammo_pri")end
function e.InterCall_village_003(n,n,n)e.EnableMarker("TppMarker2Locator_village_assult01",0,"marker_wep_assault")end
function e.InterCall_village_004(n,n,n)e.EnableMarker("TppMarker2Locator_village_grenade01",0,"marker_wep_grenade")end
function e.InterCall_village_005(n,n,n)e.EnableMarker("TppMarker2Locator_village_shotgun01",0,"marker_wep_shotgun")end
function e.InterCall_village_006(e,e,e)TppMarker.Enable("TppMarker2Locator_village_weaponRoom",0,"none","map_only_icon",0,false,true)end
function e.InterCall_village_007(n,n,n)e.EnableMarkerGimmick{"village_gun001","village_gun002"}end
function e.InterCall_village_008(n,n,n)e.EnableMarkerGimmick{"village_mortar001","village_mortar002","village_mortar003"}end
function e.InterCall_village_009(n,n,n)e.EnableMarker({"TppMarker2Locator_village_trash01","TppMarker2Locator_village_trash02","TppMarker2Locator_village_trash03","TppMarker2Locator_village_trash04"},0,"marker_dustbox")end
function e.InterCall_village_010(n,n,n)e.EnableMarker("TppMarker2Locator_village_dia0004",2,"marker_diamond_gem")end
function e.InterCall_village_011(n,n,n)e.EnableMarker("TppMarker2Locator_village_generator01",0,"marker_power")end
function e.InterCall_village_012(n,n,n)e.EnableMarker({"TppMarker2Locator_village_antn01","TppMarker2Locator_village_antn02"},0,"marker_antenna")end
function e.InterCall_village_013(n,n,n)e.EnableMarker("TppMarker2Locator_village_radio",0,"marker_comm_inst")end
function e.InterCall_bridge_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][bridge]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_commFacility_001(n,n,n)e.EnableMarker("TppMarker2Locator_commFacility_grenade01",0,"marker_wep_grenade")end
function e.InterCall_commFacility_002(n,n,n)e.EnableMarker("TppMarker2Locator_commFacility_ammo01",0,"marker_ammo_pri")end
function e.InterCall_commFacility_003(n,n,n)e.EnableMarkerGimmick{"commFacility_gun001","commFacility_gun002"}end
function e.InterCall_commFacility_004(n,n,n)e.EnableMarkerGimmick{"commFacility_mortar001","commFacility_mortar002"}end
function e.InterCall_commFacility_005(n,n,n)e.EnableMarker("TppMarker2Locator_commFacility_trash01",0,"marker_dustbox")end
function e.InterCall_commFacility_006(n,n,n)e.EnableMarker("TppMarker2Locator_commFacility_dia0023",2,"marker_diamond_gem")end
function e.InterCall_commFacility_007(n,n,n)e.EnableMarker("TppMarker2Locator_commFacility_generator01",0,"marker_power")end
function e.InterCall_commFacility_008(n,n,n)e.EnableMarker({"TppMarker2Locator_commFacility_antn01","TppMarker2Locator_commFacility_antn02","TppMarker2Locator_commFacility_antn03"},0,"marker_antenna")end
function e.InterCall_commFacility_009(n,n,n)e.EnableMarker("TppMarker2Locator_commFacility_radio",0,"marker_comm_inst")end
function e.InterCall_commFacility_010(n,n,n)e.EnableMarker("TppMarker2Locator_commFacility_conntena01",0,"marker_container")end
function e.InterCall_slopedTown_001(n,n,n)e.EnableMarker("TppMarker2Locator_slopedTown_ammo01",0,"marker_ammo_pri")end
function e.InterCall_slopedTown_002(n,n,n)e.EnableMarker("TppMarker2Locator_slopedTown_assult01",0,"marker_wep_assault")end
function e.InterCall_slopedTown_003(n,n,n)e.EnableMarker("TppMarker2Locator_slopedTown_grenade01",0,"marker_wep_grenade")end
function e.InterCall_slopedTown_004(n,n,n)e.EnableMarker("TppMarker2Locator_slopedTown_shotgun01",0,"marker_wep_shotgun")end
function e.InterCall_slopedTown_005(n,n,n)e.EnableMarker("TppMarker2Locator_slopedTown_ammo02",0,"marker_ammo_pri")end
function e.InterCall_slopedTown_006(e,e,e)TppMarker.Enable("TppMarker2Locator_slopedTown_weaponRoom",0,"none","map_only_icon",0,false,true)end
function e.InterCall_slopedTown_007(n,n,n)e.EnableMarkerGimmick{"slopedTown_gun001","slopedTown_gun002"}end
function e.InterCall_slopedTown_008(n,n,n)e.EnableMarkerGimmick{"slopedTown_mortar001","slopedTown_mortar002","slopedTown_mortar003"}end
function e.InterCall_slopedTown_009(n,n,n)e.EnableMarker({"TppMarker2Locator_slopedTown_trash01","TppMarker2Locator_slopedTown_trash02"},0,"marker_dustbox")end
function e.InterCall_slopedTown_010(n,n,n)e.EnableMarker("TppMarker2Locator_slopedTown_dia0013",0,"marker_diamond_gem")end
function e.InterCall_slopedTown_011(n,n,n)e.EnableMarkerGimmick{"slopedTown_antiair001","slopedTown_antiair002"}end
function e.InterCall_slopedTown_012(n,n,n)e.EnableMarker("TppMarker2Locator_slopedTown_generator01",0,"marker_power")end
function e.InterCall_slopedTown_013(n,n,n)e.EnableMarker({"TppMarker2Locator_slopedTown_antn01","TppMarker2Locator_slopedTown_antn02"},0,"marker_antenna")end
function e.InterCall_slopedTown_014(n,n,n)e.EnableMarker("TppMarker2Locator_slopedTown_radio",0,"marker_comm_inst")end
function e.InterCall_enemyBase_001(n,n,n)e.EnableMarker("TppMarker2Locator_enemyBase_ammo01",0,"marker_ammo_pri")end
function e.InterCall_enemyBase_002(n,n,n)e.EnableMarker("TppMarker2Locator_enemyBase_ammo02",0,"marker_ammo_pri")end
function e.InterCall_enemyBase_003(n,n,n)e.EnableMarkerGimmick{"enemyBase_gun001","enemyBase_gun002","enemyBase_gun003","enemyBase_gun004","enemyBase_gun005"}end
function e.InterCall_enemyBase_004(n,n,n)e.EnableMarkerGimmick{"enemyBase_mortar001","enemyBase_mortar002","enemyBase_mortar003","enemyBase_mortar004","enemyBase_mortar005"}end
function e.InterCall_enemyBase_005(n,n,n)e.EnableMarker({"TppMarker2Locator_enemyBase_trash01","TppMarker2Locator_enemyBase_trash02","TppMarker2Locator_enemyBase_trash03"},0,"marker_dustbox")end
function e.InterCall_enemyBase_006(n,n,n)e.EnableMarker("TppMarker2Locator_enemyBase_dia0004",0,"marker_diamond_gem")end
function e.InterCall_enemyBase_007(n,n,n)e.EnableMarkerGimmick{"enemyBase_antiair001","enemyBase_antiair002"}end
function e.InterCall_enemyBase_008(n,n,n)e.EnableMarker({"TppMarker2Locator_enemyBase_generator01","TppMarker2Locator_enemyBase_generator02"},0,"marker_power")end
function e.InterCall_enemyBase_009(n,n,n)e.EnableMarker("TppMarker2Locator_enemyBase_antn01",0,"marker_antenna")end
function e.InterCall_enemyBase_010(n,n,n)e.EnableMarker("TppMarker2Locator_enemyBase_radio",0,"marker_comm_inst")end
function e.InterCall_enemyBase_011(n,n,n)e.EnableMarker("TppMarker2Locator_enemyBase_conntena01",0,"marker_container")end
function e.InterCall_fieldEast_001(n,n,n)e.EnableMarker("TppMarker2Locator_fieldEast_dia0017",2,"marker_diamond_gem")end
function e.InterCall_fieldEast_002(n,n,n)e.EnableMarker("TppMarker2Locator_fieldEast_viewPoint",0,"marker_info_vantage_point")end
function e.InterCall_fieldWest_001(n,n,n)e.EnableMarker("TppMarker2Locator_fieldWest_dia0021",0,"marker_diamond_gem")end
function e.InterCall_fieldWest_002(n,n,n)e.EnableMarker("TppMarker2Locator_fieldWest_viewPoint",0,"marker_info_vantage_point")end
function e.InterCall_remnantsNorth_001(n,n,n)e.EnableMarker("TppMarker2Locator_remnantsNorth_dia0010",0,"marker_diamond_gem")end
function e.InterCall_remnantsNorth_002(n,n,n)e.EnableMarker("TppMarker2Locator_remnantsNorth_viewPoint",0,"marker_info_vantage_point")end
function e.InterCall_tentEast_001(n,n,n)e.EnableMarker("TppMarker2Locator_tentEast_dia0043",0,"marker_diamond_gem")end
function e.InterCall_tentEast_002(n,n,n)e.EnableMarker("TppMarker2Locator_tentEast_viewPoint",0,"marker_info_vantage_point")end
function e.InterCall_commWest_001(n,n,n)e.EnableMarker("TppMarker2Locator_commWest_dia0042",0,"marker_diamond_gem")end
function e.InterCall_commWest_002(n,n,n)e.EnableMarker("TppMarker2Locator_commWest_viewPoint",0,"marker_info_vantage_point")end
function e.InterCall_villageEast_001(n,n,n)e.EnableMarker("TppMarker2Locator_villageEast_dia0015",0,"marker_diamond_gem")end
function e.InterCall_villageEast_002(n,n,n)e.EnableMarker("TppMarker2Locator_villageEast_viewPoint",0,"marker_info_vantage_point")end
function e.InterCall_villageNorth_001(n,n,n)e.EnableMarker("TppMarker2Locator_villageNorth_dia0005",0,"marker_diamond_gem")end
function e.InterCall_villageNorth_002(n,n,n)e.EnableMarker("TppMarker2Locator_villageNorth_viewPoint",0,"marker_info_vantage_point")end
function e.InterCall_villageWest_001(n,n,n)e.EnableMarker("TppMarker2Locator_villageWest_dia0006",0,"marker_diamond_gem")end
function e.InterCall_villageWest_002(n,n,n)e.EnableMarker("TppMarker2Locator_villageWest_viewPoint",0,"marker_info_vantage_point")end
function e.InterCall_ruinsNorth_001(n,n,n)e.EnableMarker("TppMarker2Locator_ruinsNorth_dia0005",0,"marker_diamond_gem")end
function e.InterCall_ruinsNorth_002(n,n,n)e.EnableMarker("TppMarker2Locator_ruinsNorth_viewPoint",0,"marker_info_vantage_point")end
function e.InterCall_bridgeNorth_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][bridgeNorth]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_bridgeWest_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][bridgeWest]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_cliffEast_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][cliffEast]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_cliffSouth_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][cliffSouth]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_cliffWest_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][cliffWest]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_enemyNorth_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][enemyNorth]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_fortSouth_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][fortSouth]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_fortWest_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][fortWest]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_slopedEast_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][slopedEast]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_slopedWest_001(n,n,n)e.EnableMarker("TppMarker2Locator_slopedWest_dia0025",0,"marker_diamond_gem")end
function e.InterCall_slopedWest_002(n,n,n)e.EnableMarker("TppMarker2Locator_slopedWest_viewPoint",0,"marker_info_vantage_point")end
function e.InterCall_plantSouth_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][plantSouth]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_plantWest_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][plantWest]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_sovietSouth_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][sovietSouth]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_waterwayEast_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][waterwayEast]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_outland_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][outland]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_flowStation_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][flowStation]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_swamp_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][swamp]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_pfCamp_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][pfCamp]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_savannah_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][savannah]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_banana_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][banana]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_diamond_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][diamond]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_diamondRiver_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][diamondRiver]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_hill_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][hill]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_factory_001(e,e,e)SubtitlesCommand.DisplayText("[dbg][factory]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
function e.InterCall_lab_001(n,n,n)SubtitlesCommand.DisplayText("[dbg][lab]この場所でダイヤモンドの原石を見つけた・・・","Default",3e3)end
e.geneInter={afgh_cliffTown_cp={{name="debug_geneInter_cliffTown_001",func=e.InterCall_cliffTown_001},nil},afgh_tent_cp={{name="debug_geneInter_tent_001",func=e.InterCall_tent_001},nil},afgh_waterWay_cp={{name="debug_geneInter_waterWay_001",func=e.InterCall_waterWay_001},nil},afgh_powerPlant_cp={{name="debug_geneInter_powerPlant_001",func=e.InterCall_powerPlant_001},nil},afgh_sovietBase_cp={{name="debug_geneInter_sovietBase_001",func=e.InterCall_sovietBase_001},nil},afgh_remnants_cp={{name="debug_geneInter_remnants_001",func=e.InterCall_remnants_001},nil},afgh_field_cp={nil},afgh_citadel_cp={{name="debug_geneInter_citadel_001",func=e.InterCall_citadel_001},nil},afgh_fort_cp={{name="debug_geneInter_fort_001",func=e.InterCall_fort_001},nil},afgh_village_cp={{name="enqt1000_1f1710",func=e.InterCall_village_003},{name="enqt1000_1f1410",func=e.InterCall_village_004},{name="enqt1000_1f1b10",func=e.InterCall_village_005},nil},afgh_bridge_cp={{name="debug_geneInter_bridge_001",func=e.InterCall_bridge_001},nil},afgh_commFacility_cp={{name="enqt1000_1f1h10",func=e.InterCall_commFacility_005},nil},afgh_slopedTown_cp={nil},afgh_enemyBase_cp={nil},afgh_fieldEast_ob={{name="enqt1000_1f1m10",func=e.InterCall_fieldEast_002},nil},afgh_fieldWest_ob={{name="enqt1000_1f1m10",func=e.InterCall_fieldWest_002},nil},afgh_remnantsNorth_ob={{name="enqt1000_1f1m10",func=e.InterCall_remnantsNorth_002},nil},afgh_tentEast_ob={{name="enqt1000_1f1m10",func=e.InterCall_tentEast_002},nil},afgh_commWest_ob={{name="enqt1000_1f1m10",func=e.InterCall_commWest_002},nil},afgh_villageEast_ob={{name="enqt1000_1f1m10",func=e.InterCall_villageEast_002},nil},afgh_villageNorth_ob={{name="enqt1000_1f1m10",func=e.InterCall_villageNorth_002},nil},afgh_villageWest_ob={{name="enqt1000_1f1m10",func=e.InterCall_villageWest_002},nil},afgh_ruinsNorth_ob={{name="enqt1000_1f1m10",func=e.InterCall_ruinsNorth_002},nil},afgh_bridgeNorth_ob={{name="debug_geneInter_bridgeNorth_001",func=e.InterCall_bridgeNorth_001},nil},afgh_bridgeWest_ob={{name="debug_geneInter_bridgeWest_001",func=e.InterCall_bridgeWest_001},nil},afgh_cliffEast_ob={{name="debug_geneInter_cliffEast_001",func=e.InterCall_cliffEast_001},nil},afgh_cliffSouth_ob={{name="debug_geneInter_cliffSouth_001",func=e.InterCall_cliffSouth_001},nil},afgh_cliffWest_ob={{name="debug_geneInter_cliffWest_001",func=e.InterCall_cliffWest_001},nil},afgh_enemyNorth_ob={{name="debug_geneInter_enemyNorth_001",func=e.InterCall_enemyNorth_001},nil},afgh_fortSouth_ob={{name="debug_geneInter_fortSouth_001",func=e.InterCall_fortSouth_001},nil},afgh_fortWest_ob={{name="debug_geneInter_fortWest_001",func=e.InterCall_fortWest_001},nil},afgh_slopedEast_ob={{name="debug_geneInter_slopedEast_001",func=e.InterCall_slopedEast_001},nil},afgh_slopedWest_ob={{name="enqt1000_1f1m10",func=e.InterCall_slopedWest_002},nil},afgh_plantSouth_ob={{name="debug_geneInter_plantSouth_001",func=e.InterCall_plantSouth_001},nil},afgh_plantWest_ob={{name="debug_geneInter_plantWest_001",func=e.InterCall_plantWest_001},nil},afgh_sovietSouth_ob={{name="debug_geneInter_sovietSouth_001",func=e.InterCall_sovietSouth_001},nil},afgh_waterwayEast_ob={{name="debug_geneInter_waterwayEast_001",func=e.InterCall_waterwayEast_001},nil},mafr_outland_cp={{name="debug_geneInter_outland_001",func=e.InterCall_outland_001},nil},mafr_flowStation_cp={{name="debug_geneInter_flowStation_001",func=e.InterCall_flowStation_001},nil},mafr_swamp_cp={{name="debug_geneInter_swamp_001",func=e.InterCall_swamp_001},nil},mafr_pfCamp_cp={{name="debug_geneInter_pfCamp_001",func=e.InterCall_pfCamp_001},nil},mafr_savannah_cp={{name="debug_geneInter_savannah_001",func=e.InterCall_savannah_001},nil},mafr_banana_cp={{name="debug_geneInter_banana_001",func=e.InterCall_banana_001},nil},mafr_diamond_cp={{name="debug_geneInter_diamond_001",func=e.InterCall_diamond_001},nil},mafr_diamondRiver_cp={{name="debug_geneInter_diamondRiver_001",func=e.InterCall_diamondRiver_001},nil},mafr_hill_cp={{name="debug_geneInter_hill_001",func=e.InterCall_hill_001},nil},mafr_factory_cp={{name="debug_geneInter_factory_001",func=e.InterCall_factory_001},nil},mafr_lab_cp={{name="debug_geneInter_lab_001",func=e.InterCall_lab_001},nil}}return e