Gun Format (partial): (39375763ab913.lua) 
Code:
   bullet={ 
      { 
         TppEquip.BL_Rf762mmSniperMag, //Ammo ID 
         450, 
         450, 
         15, 
         14, 
         15, 
         1, 
         2, 
         TppEquip.RICOCHET_SIZE_LARGE, //SMALL, DEFAULT, LARGE 
         TppEquip.BULLET_TYPE_NORMAL, //NORMAL, SPREAD, BLAST 
         0, //TppEquip.BLA_xxxx 
         1 
      }

Code:
   bulletParamSetsBase={ 
      { 
         20, 
         40, 
         .5, 
         15, 
         30, 
         .5, 
         40, 
         60, 
         .14, 
         TppEquip.PENETRATE_LEVEL_HANDGUN, //HANDGUN, TRANQ, RIFLE, AMRIFLE 
         TppEquip.PENETRATE_LEVEL_TRANQ, //HANDGUN, TRANQ, RIFLE, AMRIFLE 
         24 
      }

Code:
   receiver={ 
      { 
         TppDamage.ATK_60415, //TppDamage.ATK_GunID 
         14, 
         13, 
         19, 
         29 
      }

Code:
   magazine={ 
      { 
         TppEquip.EQP_AM_60415, //TppEquip.EQP_PartType_GunID 
         5, //Magazine size 
         42, //Total ammo 
         TppEquip.BL_Rf762mmSniperMagAP //TppEquip.BL_AmmoID 
      }

Code:
   receiverParamSetsSystem={{ 
         TppEquip.EQP_TYPE_Sniper, //Handgun, Submachinegun, Assault, Sniper, Shotgun, Missile, Machinegun, GrenadeLauncher 
         TppEquip.RETICLE_UI_SNIPER, //HANDGUN, HANDGUN_TRANQ, GRENADER, SUBMACHINEGUN, ASSAULT, SHOTGUN, SNIPER, MACHINEGUN, MISSILE 
         TppEquip.TRIGGER_FULLAUTO, //COCKING, SEMIAUTO, FULLAUTO, 3PBURST 
         1, 
         1 
      },

Code:
   gunBasic={ 
      { 
         1, 
         1, 
         1, 
         0, 
         0, 
         0, 
         0, 
         0, 
         0, 
         0, 
         0 
      }

Code:
   receiverParamSetsBase={ 
      { 
         600, 
         30, 
         .5, 
         30, 
         30 
      }

Code:
   receiverParamSetsWobbling={ //Handles gun sway 
      { 
         2.29, 
         1.73, 
         9.65, 
         .19, 
         8.62, 
         2.78, 
         .27 
      }

Code:
   barrelParamSetsBase={ 
      { 
         1, 
         1, 
         1, 
         1, 
         1, 
         1 
      }

Code:
   barrel={ 
      { 
         0, 
         TppEquip.BARREL_LENGTH_SHORT //SHORT, MIDDLE, LONG 
      }

Code:
   muzzleOption={ 
      0, 
      { 
         1, 
         30, 
         1 
      }

Code:
   option={ 
      { 
         1, 
         0 
      }

Code:
   sight={ 
      { 
         0, 
         0, 
         0, 
         TppEquip.SCOPE_UI_DOT, //DOT, HOLO, NONE, DEFAULT 
         1, 
         0 
      }

Code:
   stock={ 
      { 
         1.2, 
         .75 
      }

Code:
   underBarrel={ 
      { 
         TppEquip.RC_None, 
         TppEquip.AM_None 
      }


Research Format: (f4866469f343.lua) 

Code:
TppMotherBaseManagement.RegCstDev 
{ 
   p00=50071, //Item ID 
   p01=TppEquip.EQP_WP_Com_sg_020_FL, //Asset name 
   p02=TppMbDev.EQP_DEV_TYPE_Shotgun, //Asset type 
   p03=0, //Prerequisite Item ID 
   p04=0, //Specialist requirement (handgun specialist, cybernetics specialist, etc) 
   p05=65535, //Required flag (set 0 to disable check) 
   p06="name_wp_4040", //Item name (displayed in iDroid) 
   p07="info_wp_4040", //Item description (displayed in iDroid) 
   p08="/Assets/tpp/ui/texture/EquipIcon/npc/ui_wp_com_sg_020_alp", //Item picture (displayed in iDroid) 
   p09=TppMbDev.EQP_DEV_GROUP_WEAPON_180, //Item group (tool/item/skin/etc) 
   p30="real_wp_4040", //Base item 
   p31=0, //??? (boolean) 
   p32=0, //??? (boolean 
   p33=0, //??? (boolean) 
   p34=0, //??? (boolean) 
   p35=0 //Equippable by security staff (boolean) 
}


Detection Format: (290cbdda48b0e.lua) 

Code:
TppSoldier2.ReloadSoldier2ParameterTables 
{ 
   sightFormParameter={ 
      baseSight={ 
         discovery={ 
            distance=10, 
            verticalAngle=36, 
            horizontalAngle=48 
         }, 
         indis={ 
            distance=20, 
            verticalAngle=60, 
            horizontalAngle=80 
         }, 
         dim={ 
            distance=45, 
            verticalAngle=60, 
            horizontalAngle=80 
         }, 
         far={ 
            distance=70, 
            verticalAngle=12, 
            horizontalAngle=8 
         } 
      } 
}


Bullet Penetration Format: (63a6d1a65eed.lua) 

Code:
TppBullet.ReloadRecoilMaterials 
{ 
   RecoilMaterial={ 
      { 
         "MTR_IRON_A", //Material type 
         TppEquip.PENETRATE_LEVEL_AMRIFLE, //Bullet type required to penetrate 
         "IRON_A", //material name 
         1, //Set 0 to ignore collision 
         1 //Set 0 to ignore collision 
      } 
}


Motherbase Expansion Format: (2a707b8155b1d.lua) 

Code:
TppMotherBaseManagement.RegisterCommandClusterBuildParam 
{ 
   base="MotherBase", //Base name (MB/FOB1/FOB2/FOB3) 
   grade=1, //Expansion tier (1-4) 
   addCombatLimit=30, //(Staff limit increase) 
   addDevelopLimit=30, //(Staff limit increase) 
   addBaseDevLimit=30, //(Staff limit increase) 
   addSupportLimit=30, //(Staff limit increase) 
   addSpyLimit=30, //(Staff limit increase) 
   addMedicalLimit=30, //(Staff limit increase) 
   addSecurityLimit=25, //(Staff limit increase) 
   gmp=0, //GMP cost 
   resourceA="None", //Required resource name 
   resourceACount=0, //Required resource count 
   resourceB="None", //Required resource name 
   resourceBCount=0, //Require resource count 
   timeMinute=0 //Construction time 
}


Motherbase Function Format: (2a707b8155b1d.lua) 

Code:
TppMotherBaseManagement.RegisterSectionFuncRankLines 
{ 
   sectionFuncId=TppMotherBaseManagementConst.SECTION_FUNC_ID_SUPPORT_STRIKE, //Function ID 
   eLv=9, //E rank requirement 
   dLv=19, //D rank requirement 
   cLv=33, //C rank requirement 
   bLv=51, //B rank requirement 
   aLv=73, //A rank requirement 
   sLv=99 /S rank requirement 
}


Motherbase Resource Generation Format: (2a707b8155b1d.lua) 

Code:
TppMotherBaseManagement.RegisterAutoResourceParam 
{ 
   oceanAreaId=1, //Base location 
   sectionFuncRank="F", //Base function rank 
   count=6e3, //Amount of resource generated 
   commonMetalRate=33, //Resource chance 
   minorMetalRate=1, //Resource chance 
   preciousMetalRate=0, //Resource chance 
   fuelResourceRate=33, //Resource chance 
   bioticResourceRate=33 //Resource chance 
}


Motherbase Container Processing Format: (2a707b8155b1d.lua) 

Code:
TppMotherBaseManagement.RegisterContainerProcessingParam 
{ 
   sectionFuncRank="S", //Function rank 
   commonMetalTimeMinute=10, //Amount of time to process type 
   minorMetalTimeMinute=10, //Amount of time to process type 
   preciousMetalTimeMinute=10, //Amount of time to process type 
   fuelResourceTimeMinute=10, //Amount of time to process type 
   bioticResourceTimeMinute=10 //Amount of time to process type 
} 
TppMotherBaseManagement.RegisterContainerProcessingBasicParam 
{ 
   commonMetalProcessCount=500, //Amount processed 
   minorMetalProcessCount=250, //Amount processed 
   preciousMetalProcessCount=50, //Amount processed 
   fuelResourceProcessCount=500, //Amount processed 
   bioticResourceProcessCount=500, //Amount processed 
   fobRate=.15 //Rate at which FOBs process (count*rate) 
}


Motherbase Sickbay Format: (2a707b8155b1d.lua) 

Code:
TppMotherBaseManagement.RegisterMedicalSectionFuncTreatmentParam 
{ 
   treatmentTimeMinute=12, //Amount of time between treatments 
   treatmentRates={ 
      none=0, //Treatment chance of success, set 100 
      f=50, //Treatment chance of success, set 100 
      e=55, //Treatment chance of success, set 100 
      d=60, //Treatment chance of success, set 100 
      c=70, //Treatment chance of success, set 100 
      b=80, //Treatment chance of success, set 100 
      a=90, //Treatment chance of success, set 100 
      s=100 //Treatment chance of success, set 100 
   }, 
   worseRate=50, //Set 0 
   deadRates={ 
      weight1=1, //Don't edit 
      weight2=2, //Don't edit 
      weight3=3, //Don't edit 
      weight4=4, //Don't edit 
      weight5=5, //Don't edit 
      weight6=10, //Don't edit 
      weight7=20 //Don't edit 
   }, 
   deadCountLimit=5, //Set 0 
   initWeightMildMin=1, //Set 0 
   initWeightMildMax=2, //Set 0 
   initWeightStandardMin=2, //Set 0 
   initWeightStandardMax=4, //Set 0 
   initWeightCriticalMin=3, //Set 0 
   initWeightCriticalMax=5, //Set 0 
   sickRateWithRed=5, //Set 0 
   sickCountLimitWithRed=3 //Set 0 
}


Support Strike Cost Format: (3d8bbdd5947a4.lua) 

Code:
TppSupportRequest.RegisterSupportAttackGmpCostTable 
{ 
   strike={ 
      0, 
      1e3, 
      9e3, 
      23e3, 
      43e3, 
      51e3, 
      73e3, 
      99e3 
   }, 
   smoke={ 
      0, 
      1e3, 
      5e3, 
      14e3, 
      25e3, 
      41e3, 
      61e3, 
      85e3 
   }, 
   sleepGas={ 
      0, 
      1e3, 
      9e3, 
      19e3, 
      33e3, 
      51e3, 
      73e3, 
      99e3 
   }, 
   chaff={ 
      0, 
      1e3, 
      5e3, 
      14e3, 
      25e3, 
      41e3, 
      61e3, 
      85e3 
   }, 
   weather=33e3 
}


FOB Security Cost Format: (3d8bbdd5947a4.lua) 

Code:
endTppMotherBaseManagement.RegisterFobSecurityCostParam{ 
   soldierBasicGmp=100, 
   grade0=0, 
   grade1=100, 
   grade2=200, 
   grade3=300, 
   grade4=400, 
   grade5=500, 
   grade6=600, 
   grade7=700, 
   grade8=800, 
   grade9=900 
}TppMotherBaseManagement.RegisterSecurityCostPerUnit{ 
   soldier={ 
      100, 
      150, 
      200, 
      300, 
      500, 
      800, 
      1e3 
   } 
}


PF Point Shop Format: (3d8bbdd5947a4.lua) 

Code:
TppMotherBaseManagement.RegisterPfRatingPointParam{ 
   point=1e4, //PF Point cost 
   rank="A", //Staff rank 
   section="Combat" //Rank section 
} 
TppMotherBaseManagement.RegisterPfRatingPointParam{ 
   point=3e3, //PF Point cost 
   resource="FuelResource", //Resource type 
   count="5000" //Resource amount 
}


Mission Rank Format: (f7804f9e4152.lua/TPPResult.lua)

Code:
e.RANK_THRESHOLD={S=13e4,A=1e5,B=6e4,C=3e4,D=1e4,E=0}