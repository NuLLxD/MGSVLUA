local e={}local m=256
local c=0
local I=0
local T="quest_block"local d="QStep_Clear"local g=Fox.StrCode32
local O=Tpp.StrCode32Table
local l=Tpp.IsTypeFunc
local o=Tpp.IsTypeTable
local f=Tpp.IsTypeString
local i=TppDefine.Enum{"NONE","DEACTIVATE","DEACTIVATING","ACTIVATE"}local t=TppDefine.Enum{"MISSION","FREE","HELI"}local s=TppDefine.Enum{"OPEN","CLEAR","FAILURE","UPDATE"}local N={"tent","field","ruins","waterway","cliffTown","commFacility","sovietBase","fort","citadel"}local D={"outland","pfCamp","savannah","hill","banana","diamond","lab"}local p={Command="ly003_cl00_npc0000|cl00pl0_uq_0000_npc2|Marker_shootingPractice",Develop="ly003_cl02_npc0000|cl02pl0_uq_0020_npc2|Marker_shootingPractice",Support="ly003_cl03_npc0000|cl03pl0_uq_0030_npc2|Marker_shootingPractice",BaseDev="ly003_cl06_npc0000|cl06pl0_uq_0060_npc2|Marker_shootingPractice",Medical="ly003_cl04_npc0000|cl04pl0_uq_0040_npc2|Marker_shootingPractice",Spy="ly003_cl05_npc0000|cl05pl0_uq_0050_npc2|Marker_shootingPractice",Combat="ly003_cl01_npc0000|cl01pl0_uq_0010_npc2|Marker_shootingPractice"}e.prevMissionType=t.HELI
local u={{questName="ruins_q19010",questId="ruins_q19010",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(1622.974,322.257,1062.973),radius=5},{questName="commFacility_q19013",questId="commFacility_q19013",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(1589.157,352.634,47.628),radius=5},{questName="outland_q19011",questId="outland_q19011",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(222.113,20.445,-930.962),radius=5},{questName="hill_q19012",questId="hill_q19012",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(1910.658,59.872,-231.274),radius=5},{questName="ruins_q60115",questId="quest_q60115",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(501.702,321.852,1194.651),radius=4.5},{questName="sovietBase_q60110",questId="quest_q60110",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-719.57,536.851,-1571.775),radius=4.5},{questName="citadel_q60112",questId="quest_q60112",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(785.013,473.162,-916.954),radius=4.5},{questName="outland_q60113",questId="quest_q60113",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(-281.612,-8.36,751.687),radius=4.5},{questName="pfCamp_q60114",questId="quest_q60114",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(712.931,-3.225,1221.926),radius=4.5},{questName="sovietBase_q60111",questId="quest_q60111",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-2330.799,438.515,-1568.261),radius=4.5},{questName="tent_q10010",questId="tent_q10010",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1426.164,319.449,1053.029),radius=5.5},{questName="field_q10020",questId="field_q10020",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(574.394,320.805,1091.39),radius=5},{questName="fort_q10080",questId="fort_q10080",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(2144.585,459.984,-1764.566),radius=5},{questName="cliffTown_q10050",questId="cliffTown_q10050",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(545.646,339.103,7.983),radius=5},{questName="waterway_q10040",questId="waterway_q10040",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1200,399,-660),radius=5},{questName="commFacility_q10060",questId="commFacility_q10060",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(1580.025,346.609,47.889),radius=5},{questName="pfCamp_q10200",questId="pfCamp_q10200",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(1830.153,-12.065,1217.415),radius=5},{questName="outland_q10100",questId="outland_q10100",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(-1117,-22,-250),radius=5},{questName="savannah_q10300",questId="savannah_q10300",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(352.291,-5.991,.927),radius=5},{questName="banana_q10500",questId="banana_q10500",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(846.97,36.452,-917.762),radius=5},{questName="hill_q10400",questId="hill_q10400",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2155.126,56.012,392.11),radius=5},{questName="diamond_q10600",questId="diamond_q10600",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(1611.429,128.189,-848.904),radius=5},{questName="ruins_q10030",questId="ruins_q10030",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(1301.97,331.741,1746.641),radius=5},{questName="sovietBase_q10070",questId="sovietBase_q10070",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-2081.274,436.152,-1532.619),radius=5},{questName="lab_q10700",questId="lab_q10700",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2695.907,154.625,-2304.778),radius=5},{questName="citadel_q10090",questId="citadel_q10090",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1258.72,598.68,-3055.925),radius=5},{questName="quest_q20065",questId="quest_q20065",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(1481.748,359.7492,467.3845),radius=4.5},{questName="quest_q20025",questId="quest_q20025",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(419.7284,270.3819,2206.412),radius=4.5},{questName="quest_q20075",questId="quest_q20075",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-2200.667,443.142,-1632.121),radius=5},{questName="quest_q20805",questId="quest_q20805",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(1876.726,321.956,-426.263),radius=4.5},{questName="quest_q20905",questId="quest_q20905",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(1807.693,468.119,-1232.137),radius=4.5},{questName="quest_q20305",questId="quest_q20305",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(303.023,-5.295,401.582),radius=5},{questName="quest_q20035",questId="quest_q20035",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(1444.029,332.4536,1493.478),radius=4.5},{questName="quest_q23005",questId="quest_q23005",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(269.693,43.457,-1208.378),radius=4.5},{questName="quest_q20045",questId="quest_q20045",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1721.014,349.7935,-300.9322),radius=4.5},{questName="quest_q21005",questId="quest_q21005",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-902.816,288.046,1905.899),radius=4.5},{questName="quest_q20105",questId="quest_q20105",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(-318.246,-13.006,1078.101),radius=4},{questName="quest_q24005",questId="quest_q24005",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2527.301,71.168,-817.188),radius=4.5},{questName="quest_q20505",questId="quest_q20505",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(592.412,52.144,-955.067),radius=4},{questName="quest_q20605",questId="quest_q20605",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(1532.148,127.692,-1296.662),radius=5},{questName="quest_q25005",questId="quest_q25005",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(967.334,-11.938,1269.883),radius=4.5},{questName="quest_q27005",questId="quest_q27005",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2073.421,51.254,355.372),radius=4.5},{questName="quest_q26005",questId="quest_q26005",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(1728.982,155.168,-1869.883),radius=4.5},{questName="quest_q20055",questId="quest_q20055",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(784.1397,474.0518,-1008.116),radius=4},{questName="quest_q22005",questId="quest_q22005",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1326.552,598.564,-3041.07),radius=4.5},{questName="quest_q20405",questId="quest_q20405",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2172.657,56.106,377.634),radius=4},{questName="field_q30010",questId="field_q30010",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(516.088,321.572,1065.328),radius=5},{questName="waterway_q39010",questId="waterway_q39010",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-473.987,417.258,-496.137),radius=7},{questName="lab_q39011",questId="lab_q39011",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2656.23,144.117,-2173.246),radius=7},{questName="pfCamp_q39012",questId="pfCamp_q39012",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(1367.551,-3.12,1892.457),radius=7},{questName="commFacility_q80060",questId="commFacility_q80060",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(1385.748,368,-23.469),radius=5},{questName="field_q80020",questId="field_q80020",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(482.031,286.844,2474.655),radius=5},{questName="outland_q80100",questId="outland_q80100",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(-454.016,3.955,977.738),radius=5},{questName="pfCamp_q80200",questId="pfCamp_q80200",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(338.505,1.002,1746.528),radius=5},{questName="diamond_q80600",questId="diamond_q80600",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(1460.408,121.347,-1411.282),radius=5},{questName="hill_q80400",questId="hill_q80400",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2566.009,68,-200.753),radius=5},{questName="tent_q80010",questId="tent_q80010",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1396.746,286.758,1009.375),radius=5},{questName="lab_q80700",questId="lab_q80700",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2702.945,127.026,-1972.265),radius=5},{questName="fort_q80080",questId="fort_q80080",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(1408.371,500.486,-1300.667),radius=5},{questName="waterway_q80040",questId="waterway_q80040",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1839.279,358.371,-339.326),radius=5},{questName="quest_q20015",questId="quest_q20015",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1764.669,311.1947,805.5405),radius=4.5},{questName="quest_q20085",questId="quest_q20085",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(2154.21,458.245,-1782.244),radius=4.5},{questName="quest_q20205",questId="quest_q20205",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(911.094,-3.444,1072.21),radius=6},{questName="quest_q20705",questId="quest_q20705",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2643.892,143.728,-2179.943),radius=7},{questName="quest_q20095",questId="quest_q20095",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1216.737,609.074,-3102.734),radius=5.5},{questName="tent_q11010",questId="tent_q11010",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1058.028,290.648,1472.578),radius=5},{questName="tent_q11020",questId="tent_q11020",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1143.261,322.876,839.478),radius=5},{questName="waterway_q11030",questId="waterway_q11030",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1347.736,397.481,-729.448),radius=5},{questName="cliffTown_q11040",questId="cliffTown_q11040",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(369.861,413.892,-905.375),radius=5},{questName="savannah_q11400",questId="savannah_q11400",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(1200.66,7.889,113.637),radius=5},{questName="pfCamp_q11200",questId="pfCamp_q11200",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(1555.195,-12.034,1790.219),radius=5},{questName="commFacility_q11080",questId="commFacility_q11080",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(1475.388,344.972,13.41),radius=5},{questName="fort_q11060",questId="fort_q11060",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(1812.198,465.938,-1241.909),radius=5},{questName="outland_q11090",questId="outland_q11090",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(-386.984,9.648,762.663),radius=5},{questName="banana_q11600",questId="banana_q11600",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(563.844,77.95,-1070.378),radius=5},{questName="cliffTown_q11050",questId="cliffTown_q11050",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2383.08,86.157,-1125.214),radius=5},{questName="hill_q11500",questId="hill_q11500",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2342.049,68.132,-104.587),radius=5},{questName="savannah_q11300",questId="savannah_q11300",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(965.708,-4.035,287.023),radius=5},{questName="banana_q11700",questId="banana_q11700",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(713.795,33.409,-904.592),radius=5},{questName="fort_q11070",questId="fort_q11070",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(2194.519,429.075,-1284.068),radius=5},{questName="outland_q11100",questId="outland_q11100",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(-552.513,-.011,-197.752),radius=5},{questName="sovietBase_q99020",questId="sovietBase_q99020",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-716.5531,536.7278,-1485.517),radius=5,isImportant=true},{questName="ruins_q60010",questId="ruins_q60010",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(1331.732,295.46,2164.405),radius=4},{questName="tent_q60011",questId="tent_q60011",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-513.1647,372.9764,1148.782),radius=5},{questName="outland_q60024",questId="outland_q60024",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(-1205.26,-21.20666,129.0079),radius=5},{questName="fort_q60013",questId="fort_q60013",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(1921.452,456.3248,-1253.83),radius=4},{questName="hill_q60021",questId="hill_q60021",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2151.132,70.83097,-116.7761),radius=4.5},{questName="pfCamp_q60020",questId="pfCamp_q60020",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(1555.736,-8.822165,1725.071),radius=4},{questName="cliffTown_q60012",questId="cliffTown_q60012",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(369.4612,412.6812,-844.1393),radius=4},{questName="banana_q60023",questId="banana_q60023",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(646.064,103.2225,-1122.37),radius=4},{questName="sovietBase_q60014",questId="sovietBase_q60014",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1440.167,415.0882,-1282.796),radius=4},{questName="lab_q60022",questId="lab_q60022",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2658.126,139.3819,-2146.524),radius=4},{questName="quest_q52030",questId="quest_q52030",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1889.494,332.666,546.761),radius=5},{questName="quest_q52010",questId="quest_q52010",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(1388.719,299.004,1976.527),radius=6},{questName="quest_q52040",questId="quest_q52040",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1589.128,511.561,-2113.037),radius=5},{questName="quest_q52020",questId="quest_q52020",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(-380.063,-2.53,490.478),radius=5},{questName="quest_q52050",questId="quest_q52050",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(672.542,-3.727,108.875),radius=6},{questName="quest_q52070",questId="quest_q52070",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2364.716,56.688,314.611),radius=5},{questName="quest_q52060",questId="quest_q52060",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(1156.773,-12.097,1524.507),radius=5},{questName="quest_q52080",questId="quest_q52080",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(793.002,347.536,255.957),radius=5},{questName="quest_q52090",questId="quest_q52090",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(1722.589,152.294,-2079.907),radius=5},{questName="quest_q52100",questId="quest_q52100",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(810.898,-11.701,1194.177),radius=5},{questName="quest_q52130",questId="quest_q52130",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1836.664,358.543,-326.481),radius=6},{questName="quest_q52110",questId="quest_q52110",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(-1007.882,-14.2,-231.401),radius=5},{questName="quest_q52120",questId="quest_q52120",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(840.141,4.947,-130.741),radius=5},{questName="quest_q52140",questId="quest_q52140",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-608.622,278.374,1694.876),radius=5},{questName="outland_q99071",questId="quest_q99071",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(-648.583,-18.483,1032.586),radius=5},{questName="sovietBase_q99070",questId="quest_q99070",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-2127.887,436.594,-1564.366),radius=5},{questName="tent_q99072",questId="quest_q99072",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1761.536,310.333,806.76),radius=5},{questName="outland_q40010",questId="outland_q40010",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(222.904,20.496,-932.784),radius=5},{questName="mtbs_q99011",questId="mtbs_q99011",locationId=TppDefine.LOCATION_ID.MTBS,clusterId=TppDefine.CLUSTER_DEFINE.Medical,plntId=TppDefine.PLNT_DEFINE.Special,isImportant=true},{questName="cliffTown_q99080",questId="cliffTown_q99080",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(530.911,335.119,29.67),radius=5},{questName="mtbs_q99050",questId="mtbs_q99050",locationId=TppDefine.LOCATION_ID.MTBS,clusterId=TppDefine.CLUSTER_DEFINE.Develop,plntId=TppDefine.PLNT_DEFINE.Common1,isImportant=true},{questName="quest_q52035",questId="quest_q52035",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(730.943,320.818,88.148),radius=5},{questName="quest_q52025",questId="quest_q52025",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-608.622,278.374,1694.876),radius=5},{questName="quest_q52015",questId="quest_q52015",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1836.664,358.543,-326.481),radius=6},{questName="quest_q52075",questId="quest_q52075",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(1349.26,11.259,285.945),radius=5},{questName="quest_q52065",questId="quest_q52065",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(811.036,-11.657,1193.033),radius=5},{questName="quest_q52045",questId="quest_q52045",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(1722.589,152.294,-2079.907),radius=5},{questName="quest_q52055",questId="quest_q52055",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(-350.247,-2.555,-190.417),radius=5},{questName="quest_q52095",questId="quest_q52095",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2429.92,61.019,189.081),radius=6},{questName="quest_q52085",questId="quest_q52085",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1898.048,316.223,610.601),radius=5},{questName="quest_q52105",questId="quest_q52105",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(672.542,-3.727,108.875),radius=5},{questName="quest_q52135",questId="quest_q52135",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(1393.775,299.887,1910.528),radius=5},{questName="quest_q52115",questId="quest_q52115",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(-775.086,-3.786,563.539),radius=6},{questName="quest_q52125",questId="quest_q52125",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(1156.773,-12.097,1524.507),radius=6},{questName="quest_q52145",questId="quest_q52145",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1589.128,511.561,-2113.037),radius=5},{questName="tent_q71010",questId="quest_q71010",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1759.032,310.695,806.245),radius=5},{questName="savannah_q71300",questId="quest_q71300",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(803.255,-11.806,1225.636),radius=5},{questName="field_q71020",questId="quest_q71020",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(421.778,269.679,2207.088),radius=5},{questName="lab_q71600",questId="quest_q71600",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2522.474,100.128,-896.065),radius=5},{questName="tent_q71030",questId="quest_q71030",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-859.822,301.749,1954.213),radius=5},{questName="sovietBase_q71070",questId="quest_q71070",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-675.085,533.228,-1482.026),radius=5},{questName="cliffTown_q71050",questId="quest_q71050",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(527.023,328.63,50),radius=5},{questName="lab_q71700",questId="quest_q71700",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2746.635,200.042,-2401.35),radius=5},{questName="field_q71090",questId="quest_q71090",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(474.7,322.281,1062.864),radius=5},{questName="waterway_q71040",questId="quest_q71040",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1490.294,396.138,-792.581),radius=5},{questName="fort_q71080",questId="quest_q71080",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(2080.718,456.726,-1927.582),radius=5},{questName="cliffTown_q71060",questId="quest_q71060",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(782.651,463.722,-1027.08),radius=5},{questName="diamond_q71500",questId="quest_q71500",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(1518,145,-2115),radius=5},{questName="banana_q71400",questId="quest_q71400",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(278.127,42.996,-1232.378),radius=5},{questName="outland_q71200",questId="quest_q71200",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(-594.489,-17.482,1095.318),radius=5},{questName="sovietBase_q99030",questId="sovietBase_q99030",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-2199.997,456.352,-1581.944),radius=6,isImportant=true},{questName="tent_q99040",questId="tent_q99040",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1762.503,310.288,802.482),radius=5,isImportant=true},{questName="outland_q20913",questId="quest_q20913",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(-958.532,-14.1,-224.044),radius=5,isImportant=true},{questName="lab_q20914",questId="quest_q20914",locationId=TppDefine.LOCATION_ID.MAFR,iconPos=Vector3(2747.504,200.042,-2401.418),radius=5,isImportant=true},{questName="sovietBase_q20912",questId="quest_q20912",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1573.917,369.848,-321.113),radius=5,isImportant=true},{questName="tent_q20910",questId="quest_q20910",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-865.471,300.445,1949.157),radius=5,isImportant=true},{questName="fort_q20911",questId="quest_q20911",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(2181.73,470.912,-1815.881),radius=5,isImportant=true},{questName="waterway_q99012",questId="waterway_q99012",locationId=TppDefine.LOCATION_ID.AFGH,iconPos=Vector3(-1335.904,398.264,-739.165),radius=5,isImportant=true},{questName="mtbs_q42010",questId="mtbs_q42010",locationId=TppDefine.LOCATION_ID.MTBS,clusterId=TppDefine.CLUSTER_DEFINE.Command,plntId=TppDefine.PLNT_DEFINE.Special},{questName="mtbs_q42020",questId="mtbs_q42020",locationId=TppDefine.LOCATION_ID.MTBS,clusterId=TppDefine.CLUSTER_DEFINE.Develop,plntId=TppDefine.PLNT_DEFINE.Special},{questName="mtbs_q42030",questId="mtbs_q42030",locationId=TppDefine.LOCATION_ID.MTBS,clusterId=TppDefine.CLUSTER_DEFINE.Support,plntId=TppDefine.PLNT_DEFINE.Special},{questName="mtbs_q42040",questId="mtbs_q42040",locationId=TppDefine.LOCATION_ID.MTBS,clusterId=TppDefine.CLUSTER_DEFINE.BaseDev,plntId=TppDefine.PLNT_DEFINE.Special},{questName="mtbs_q42060",questId="mtbs_q42060",locationId=TppDefine.LOCATION_ID.MTBS,clusterId=TppDefine.CLUSTER_DEFINE.Spy,plntId=TppDefine.PLNT_DEFINE.Special},{questName="mtbs_q42050",questId="mtbs_q42050",locationId=TppDefine.LOCATION_ID.MTBS,clusterId=TppDefine.CLUSTER_DEFINE.Medical,plntId=TppDefine.PLNT_DEFINE.Special},{questName="mtbs_q42070",questId="mtbs_q42070",locationId=TppDefine.LOCATION_ID.MTBS,clusterId=TppDefine.CLUSTER_DEFINE.Combat,plntId=TppDefine.PLNT_DEFINE.Special}}local h={ruins_q19010={radioNameFirst="f1000_rtrg0700"},outland_q19011={radioNameFirst="f1000_rtrg4380"},hill_q19012={radioNameFirst="f1000_rtrg4390"},commFacility_q19013={radioNameFirst="f1000_rtrg4370"},tent_q20910={radioNameFirst="f2000_rtrg8320",radioNameSecond="f2000_rtrg1560"},fort_q20911={radioNameFirst="f2000_rtrg8320",radioNameSecond="f2000_rtrg1560"},sovietBase_q20912={radioNameFirst="f2000_rtrg8320",radioNameSecond="f2000_rtrg1560"},outland_q20913={radioNameFirst="f2000_rtrg8320",radioNameSecond="f2000_rtrg1560"},lab_q20914={radioNameFirst="f2000_rtrg8320",radioNameSecond="f2000_rtrg1560"},cliffTown_q99080={radioNameFirst="f2000_rtrg1561"}}local _={tent_q10010="quest_extract_elite",field_q10020="quest_extract_elite",ruins_q10030="quest_extract_elite",waterway_q10040="quest_extract_elite",cliffTown_q10050="quest_extract_elite",commFacility_q10060="quest_extract_elite",sovietBase_q10070="quest_extract_elite",fort_q10080="quest_extract_elite",citadel_q10090="quest_extract_elite",outland_q10100="quest_extract_elite",pfCamp_q10200="quest_extract_elite",savannah_q10300="quest_extract_elite",hill_q10400="quest_extract_elite",banana_q10500="quest_extract_elite",diamond_q10600="quest_extract_elite",lab_q10700="quest_extract_elite",tent_q11010="quest_defeat_armor",tent_q11020="quest_defeat_armor",waterway_q11030="quest_defeat_armor",cliffTown_q11040="quest_defeat_armor",cliffTown_q11050="quest_defeat_armor",fort_q11060="quest_defeat_armor",fort_q11070="quest_defeat_armor",commFacility_q11080="quest_defeat_armor",outland_q11090="quest_defeat_armor",outland_q11100="quest_defeat_armor",pfCamp_q11200="quest_defeat_armor",savannah_q11300="quest_defeat_armor",savannah_q11400="quest_defeat_armor",hill_q11500="quest_defeat_armor",banana_q11600="quest_defeat_armor",banana_q11700="quest_defeat_armor",tent_q71010="quest_defeat_zombie",field_q71020="quest_defeat_zombie",tent_q71030="quest_defeat_zombie",waterway_q71040="quest_defeat_zombie",cliffTown_q71050="quest_defeat_zombie",cliffTown_q71060="quest_defeat_zombie",sovietBase_q71070="quest_defeat_zombie",fort_q71080="quest_defeat_zombie",field_q71090="quest_defeat_zombie",outland_q71200="quest_defeat_zombie",savannah_q71300="quest_defeat_zombie",banana_q71400="quest_defeat_zombie",diamond_q71500="quest_defeat_zombie",lab_q71600="quest_defeat_zombie",lab_q71700="quest_defeat_zombie",quest_q20015="quest_extract_hostage",quest_q20025="quest_extract_hostage",quest_q20035="quest_extract_hostage",quest_q20045="quest_extract_hostage",quest_q20055="quest_extract_hostage",quest_q20065="quest_extract_hostage",quest_q20075="quest_extract_hostage",quest_q20085="quest_extract_hostage",quest_q20095="quest_extract_hostage",quest_q20105="quest_extract_hostage",quest_q20205="quest_extract_hostage",quest_q20305="quest_extract_hostage",quest_q20405="quest_extract_hostage",quest_q20505="quest_extract_hostage",quest_q20605="quest_extract_hostage",quest_q20705="quest_extract_hostage",quest_q20805="quest_extract_hostage",quest_q20905="quest_extract_hostage",quest_q21005="quest_extract_hostage",quest_q22005="quest_extract_hostage",quest_q23005="quest_extract_hostage",quest_q24005="quest_extract_hostage",quest_q25005="quest_extract_hostage",quest_q26005="quest_extract_hostage",quest_q27005="quest_extract_hostage",quest_q52010="quest_defeat_armor_vehicle",quest_q52020="quest_defeat_armor_vehicle",quest_q52030="quest_defeat_armor_vehicle",quest_q52040="quest_defeat_armor_vehicle",quest_q52050="quest_defeat_armor_vehicle",quest_q52060="quest_defeat_armor_vehicle",quest_q52070="quest_defeat_armor_vehicle",quest_q52080="quest_defeat_armor_vehicle",quest_q52090="quest_defeat_armor_vehicle",quest_q52100="quest_defeat_armor_vehicle",quest_q52110="quest_defeat_armor_vehicle",quest_q52120="quest_defeat_armor_vehicle",quest_q52130="quest_defeat_armor_vehicle",quest_q52140="quest_defeat_armor_vehicle",quest_q52015="quest_defeat_tunk",quest_q52025="quest_defeat_tunk",quest_q52035="quest_defeat_tunk",quest_q52045="quest_defeat_tunk",quest_q52055="quest_defeat_tunk",quest_q52065="quest_defeat_tunk",quest_q52075="quest_defeat_tunk",quest_q52085="quest_defeat_tunk",quest_q52095="quest_defeat_tunk",quest_q52105="quest_defeat_tunk",quest_q52115="quest_defeat_tunk",quest_q52125="quest_defeat_tunk",quest_q52135="quest_defeat_tunk",quest_q52145="quest_defeat_tunk",mtbs_q42020="quest_target_eliminate",mtbs_q42030="quest_target_eliminate",mtbs_q42040="quest_target_eliminate",mtbs_q42050="quest_target_eliminate",mtbs_q42060="quest_target_eliminate",mtbs_q42070="quest_target_eliminate",mtbs_q42010="quest_target_eliminate"}local A={tent_q80010=TppMotherBaseManagementConst.PHOTO_1006,field_q80020=TppMotherBaseManagementConst.PHOTO_1007,waterway_q80040=TppMotherBaseManagementConst.PHOTO_1009,commFacility_q80060=TppMotherBaseManagementConst.PHOTO_1000,fort_q80080=TppMotherBaseManagementConst.PHOTO_1008,outland_q80100=TppMotherBaseManagementConst.PHOTO_1002,pfCamp_q80200=TppMotherBaseManagementConst.PHOTO_1003,hill_q80400=TppMotherBaseManagementConst.PHOTO_1005,diamond_q80600=TppMotherBaseManagementConst.PHOTO_1004,lab_q80700=TppMotherBaseManagementConst.PHOTO_1001,sovietBase_q99030=TppMotherBaseManagementConst.DESIGN_3009,tent_q99040=TppMotherBaseManagementConst.DESIGN_3002,mtbs_q99050=TppMotherBaseManagementConst.DESIGN_3000}local S={tent_q80010="key_photo_1006",field_q80020="key_photo_1007",waterway_q80040="key_photo_1009",commFacility_q80060="key_photo_1000",fort_q80080="key_photo_1008",outland_q80100="key_photo_1002",pfCamp_q80200="key_photo_1003",hill_q80400="key_photo_1005",diamond_q80600="key_photo_1004",lab_q80700="key_photo_1001"}local C={mtbs_q99060={"base44","front62"},sovietBase_q99020={"word14","word15","word51","front49"},sovietBase_q99030={"word122","word123","word124","word125","word126"},tent_q99040={"word78","word79","word87","word91"}}local q={"quest_q20015","quest_q20085","quest_q20205","quest_q20705","quest_q20095"}local t={}function t.waterway_q99010()return TppStory.IsOccuringBossQuiet()end
function t.waterway_q99012()return TppBuddyService.CheckBuddyCommonFlag(BuddyCommonFlag.BUDDY_QUIET_LOST)end
function t.sovietBase_q99020()return TppStory.GetCurrentStorySequence()>=TppDefine.STORY_SEQUENCE.CLEARD_FLAG_MISSIONS_AFTER_FIND_THE_SECRET_WEAPON
end
function t.sovietBase_q99030()return TppStory.CanPlayDemoOrRadio"OpenSideOpsAiPod"end
function t.tent_q99040()return e.IsCleard"sovietBase_q99030"end
function t.cliffTown_q99080()return TppStory.IsMissionCleard(10091)end
function t.field_q30010()return e.IsCleard"ruins_q60115"end
function e.OpenChildSoldier_1()local t=e.IsCleard"mtbs_q99050"local e=e.IsNowOccurringElapsed()local a=TppStory.IsNowOccurringElapsedMission(TppDefine.ELAPSED_MISSION_EVENT.STORY_SEQUENCE)local n=TppStory.IsMissionCleard(10093)return((a or e)and t)and n
end
function e.OpenChildSoldier_2()return e.IsCleard"outland_q20913"and e.IsCleard"lab_q20914"end
function t.outland_q20913()return e.OpenChildSoldier_1()end
function t.lab_q20914()return e.OpenChildSoldier_1()end
function t.tent_q20910()return e.OpenChildSoldier_2()end
function t.fort_q20911()return e.OpenChildSoldier_2()end
function t.sovietBase_q20912()return e.OpenChildSoldier_2()end
function t.waterway_q39010()return TppStory.IsMissionCleard(10054)end
function t.lab_q39011()return TppStory.IsMissionCleard(10151)end
function t.pfCamp_q39012()return TppStory.IsMissionCleard(10151)end
function t.ruins_q19010()return true
end
function t.commFacility_q19013()return e.IsCleard"quest_q20065"end
function t.outland_q19011()return TppStory.IsMissionCleard(10086)end
function t.hill_q19012()return TppStory.IsMissionCleard(10100)end
function t.outland_q99071()return TppStory.IsMissionCleard(10080)end
function t.sovietBase_q99070()return e.IsCleard"outland_q99071"end
function t.tent_q99072()return e.IsCleard"sovietBase_q99070"end
function t.outland_q40010()return TppStory.IsMissionCleard(10080)end
function t.sovietBase_q60110()return TppStory.IsOccuringBossQuiet()end
function t.sovietBase_q60111()return TppStory.IsMissionCleard(10121)end
function t.citadel_q60112()return TppStory.IsMissionCleard(10121)end
function t.outland_q60113()return TppStory.IsMissionCleard(10121)end
function t.pfCamp_q60114()return TppStory.IsMissionCleard(10121)end
function t.ruins_q60115()return e.IsCleard"ruins_q19010"end
function t.tent_q10010()return true
end
function t.field_q10020()local t=e.IsCleard"ruins_q60115"local e=e.IsCleard"tent_q10010"return t and e
end
function t.ruins_q10030()local t=TppStory.IsMissionCleard(10151)local e=e.IsCleard"commFacility_q10060"return t and e
end
function t.waterway_q10040()local t=TppStory.IsMissionCleard(10044)local e=e.IsCleard"cliffTown_q10050"return t and e
end
function t.cliffTown_q10050()local t=TppStory.IsMissionCleard(10041)local e=e.IsCleard"fort_q10080"return t and e
end
function t.commFacility_q10060()local t=TppStory.IsMissionCleard(10080)local e=e.IsCleard"waterway_q10040"return t and e
end
function t.sovietBase_q10070()local t=TppStory.IsMissionCleard(10151)local e=e.IsCleard"ruins_q10030"return t and e
end
function t.fort_q10080()local t=TppStory.IsMissionCleard(10040)local e=e.IsCleard"field_q10020"return t and e
end
function t.citadel_q10090()local t=TppStory.IsMissionCleard(10151)local e=e.IsCleard"sovietBase_q10070"return t and e
end
function t.outland_q10100()local t=TppStory.IsMissionCleard(10090)local e=e.IsCleard"pfCamp_q10200"return t and e
end
function t.pfCamp_q10200()return TppStory.IsMissionCleard(10086)end
function t.savannah_q10300()local t=TppStory.IsMissionCleard(10195)local e=e.IsCleard"outland_q10100"return t and e
end
function t.hill_q10400()local t=TppStory.IsMissionCleard(10110)local e=e.IsCleard"banana_q10500"return t and e
end
function t.banana_q10500()local t=TppStory.IsMissionCleard(10100)local e=e.IsCleard"savannah_q10300"return t and e
end
function t.diamond_q10600()local t=TppStory.IsMissionCleard(10120)local e=e.IsCleard"hill_q10400"return t and e
end
function t.lab_q10700()local t=TppStory.IsMissionCleard(10151)local e=e.IsCleard"diamond_q10600"return t and e
end
function t.quest_q20015()return TppStory.IsMissionCleard(10040)end
function t.quest_q20025()return e.IsCleard"quest_q20065"end
function t.quest_q20035()local t=TppStory.IsMissionCleard(10080)local e=e.IsCleard"quest_q20905"return t and e
end
function t.quest_q20045()local t=TppStory.IsMissionCleard(10091)local e=e.IsCleard"quest_q20035"return t and e
end
function t.quest_q20055()local t=TppStory.IsMissionCleard(10151)local e=e.IsCleard"quest_q21005"return t and e
end
function t.quest_q20065()return e.IsCleard"ruins_q60115"end
function t.quest_q20075()local t=TppStory.IsMissionCleard(10044)local e=e.IsCleard"quest_q20025"return t and e
end
function t.quest_q20085()local t=TppStory.IsMissionCleard(10041)local e=e.IsCleard"quest_q20015"return t and e
end
function t.quest_q20095()local t=TppStory.IsMissionCleard(10151)local e=e.IsCleard"quest_q20705"return t and e
end
function t.quest_q20105()local t=TppStory.IsMissionCleard(10100)local e=e.IsCleard"quest_q23005"return t and e
end
function t.quest_q20205()local t=TppStory.IsMissionCleard(10195)local e=e.IsCleard"quest_q20085"return t and e
end
function t.quest_q20305()return TppStory.IsMissionCleard(10080)end
function t.quest_q20405()local t=TppStory.IsMissionCleard(10093)local e=e.IsCleard"quest_q27005"return t and e
end
function t.quest_q20505()local t=TppStory.IsMissionCleard(10110)local e=e.IsCleard"quest_q24005"return t and e
end
function t.quest_q20605()local t=TppStory.IsMissionCleard(10121)local e=e.IsCleard"quest_q20505"return t and e
end
function t.quest_q20705()local t=TppStory.IsMissionCleard(10151)local e=e.IsCleard"quest_q20205"return t and e
end
function t.quest_q20805()local t=TppStory.IsMissionCleard(10054)local e=e.IsCleard"quest_q20075"return t and e
end
function t.quest_q20905()local t=TppStory.IsMissionCleard(10052)local e=e.IsCleard"quest_q20805"return t and e
end
function t.quest_q21005()local t=TppStory.IsMissionCleard(10091)local e=e.IsCleard"quest_q20045"return t and e
end
function t.quest_q22005()local t=TppStory.IsMissionCleard(10045)local e=e.IsCleard"quest_q21005"return t and e
end
function t.quest_q23005()local t=TppStory.IsMissionCleard(10090)local e=e.IsCleard"quest_q20305"return t and e
end
function t.quest_q24005()local t=TppStory.IsMissionCleard(10110)local e=e.IsCleard"quest_q20105"return t and e
end
function t.quest_q25005()local t=TppStory.IsMissionCleard(10120)local e=e.IsCleard"quest_q20605"return t and e
end
function t.quest_q26005()local t=TppStory.IsMissionCleard(10211)local e=e.IsCleard"quest_q27005"return t and e
end
function t.quest_q27005()local t=TppStory.IsMissionCleard(10211)local e=e.IsCleard"quest_q25005"return t and e
end
function t.tent_q11010()return TppStory.IsMissionCleard(10041)end
function t.tent_q11020()local t=TppStory.IsMissionCleard(10054)local e=e.IsCleard"tent_q11010"return t and e
end
function t.waterway_q11030()local t=TppStory.IsMissionCleard(10052)local e=e.IsCleard"tent_q11020"return t and e
end
function t.cliffTown_q11040()local t=TppStory.IsMissionCleard(10080)local e=e.IsCleard"waterway_q11030"return t and e
end
function t.cliffTown_q11050()local t=TppStory.IsMissionCleard(10121)local e=e.IsCleard"banana_q11600"return t and e
end
function t.fort_q11060()local t=TppStory.IsMissionCleard(10091)local e=e.IsCleard"commFacility_q11080"return t and e
end
function t.fort_q11070()local t=TppStory.IsMissionCleard(10156)local e=e.IsCleard"fort_q11060"return t and e
end
function t.commFacility_q11080()local t=TppStory.IsMissionCleard(10080)local e=e.IsCleard"cliffTown_q11040"return t and e
end
function t.outland_q11090()local t=TppStory.IsMissionCleard(10195)local e=e.IsCleard"pfCamp_q11200"return t and e
end
function t.outland_q11100()local t=TppStory.IsMissionCleard(10171)local e=e.IsCleard"banana_q11700"return t and e
end
function t.pfCamp_q11200()local t=TppStory.IsMissionCleard(10100)local e=e.IsCleard"savannah_q11400"return t and e
end
function t.savannah_q11300()local t=TppStory.IsMissionCleard(10151)local e=e.IsCleard"hill_q11500"return t and e
end
function t.savannah_q11400()return TppStory.IsMissionCleard(10086)end
function t.hill_q11500()local t=TppStory.IsMissionCleard(10120)local e=e.IsCleard"cliffTown_q11050"return t and e
end
function t.banana_q11600()local t=TppStory.IsMissionCleard(10110)local e=e.IsCleard"outland_q11090"return t and e
end
function t.banana_q11700()local t=TppStory.IsMissionCleard(10093)local e=e.IsCleard"savannah_q11300"return t and e
end
function t.tent_q71010()return TppStory.IsMissionCleard(10045)end
function t.field_q71020()local t=TppStory.IsMissionCleard(10156)local e=e.IsCleard"tent_q71010"return t and e
end
function t.tent_q71030()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"field_q71020"return t and e
end
function t.waterway_q71040()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"sovietBase_q71070"return t and e
end
function t.cliffTown_q71050()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"tent_q71030"return t and e
end
function t.cliffTown_q71060()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"sovietBase_q71070"return t and e
end
function t.sovietBase_q71070()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"tent_q71030"return t and e
end
function t.fort_q71080()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"sovietBase_q71070"return t and e
end
function t.field_q71090()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"sovietBase_q71070"return t and e
end
function t.outland_q71200()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"lab_q71600"return t and e
end
function t.savannah_q71300()return TppStory.IsMissionCleard(10093)end
function t.banana_q71400()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"lab_q71600"return t and e
end
function t.diamond_q71500()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"lab_q71600"return t and e
end
function t.lab_q71600()local t=TppStory.IsMissionCleard(10171)local e=e.IsCleard"savannah_q71300"return t and e
end
function t.lab_q71700()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"lab_q71600"return t and e
end
function t.commFacility_q80060()return TppStory.IsMissionCleard(10040)end
function t.field_q80020()local t=TppStory.IsMissionCleard(10044)local e=e.IsCleard"commFacility_q80060"return t and e
end
function t.outland_q80100()local t=TppStory.IsMissionCleard(10090)local e=e.IsCleard"field_q80020"return t and e
end
function t.pfCamp_q80200()local t=TppStory.IsMissionCleard(10110)local e=e.IsCleard"outland_q80100"return t and e
end
function t.diamond_q80600()local t=TppStory.IsMissionCleard(10120)local e=e.IsCleard"pfCamp_q80200"return t and e
end
function t.hill_q80400()local t=TppStory.IsMissionCleard(10151)local e=e.IsCleard"diamond_q80600"return t and e
end
function t.tent_q80010()local t=TppStory.IsMissionCleard(10151)local e=e.IsCleard"hill_q80400"return t and e
end
function t.lab_q80700()local t=TppStory.IsMissionCleard(10093)local e=e.IsCleard"tent_q80010"if t==true and e==true then
return true
end
return false
end
function t.fort_q80080()local t=TppStory.IsMissionCleard(10156)local e=e.IsCleard"lab_q80700"return t and e
end
function t.waterway_q80040()local t=TppStory.IsMissionCleard(10151)local e=e.IsCleard"fort_q80080"return t and e
end
function t.quest_q52010()local t=TppStory.IsMissionCleard(10054)local e=e.IsCleard"quest_q52030"return t and e
end
function t.quest_q52020()return TppStory.IsMissionCleard(10086)end
function t.quest_q52030()return TppStory.IsMissionCleard(10044)end
function t.quest_q52040()local t=TppStory.IsMissionCleard(10052)local e=e.IsCleard"quest_q52010"return t and e
end
function t.quest_q52050()local t=TppStory.IsMissionCleard(10100)local e=e.IsCleard"quest_q52020"return t and e
end
function t.quest_q52060()local t=TppStory.IsMissionCleard(10151)local e=e.IsCleard"quest_q52070"return t and e
end
function t.quest_q52070()local t=TppStory.IsMissionCleard(10120)local e=e.IsCleard"quest_q52050"return t and e
end
function t.quest_q52080()local t=e.IsCleard"tent_q99040"local e=e.IsCleard"quest_q52040"return t and e
end
function t.quest_q52090()local t=TppStory.IsMissionCleard(10093)local e=e.IsCleard"quest_q52060"return t and e
end
function t.quest_q52100()local t=TppStory.IsMissionCleard(10171)local e=e.IsCleard"quest_q52090"return t and e
end
function t.quest_q52110()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"quest_q52100"return t and e
end
function t.quest_q52120()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"quest_q52110"return t and e
end
function t.quest_q52130()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"quest_q52080"return t and e
end
function t.quest_q52140()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"quest_q52130"return t and e
end
function t.quest_q52015()local t=TppStory.IsMissionCleard(10080)local e=e.IsCleard"quest_q52025"return t and e
end
function t.quest_q52025()local t=TppStory.IsMissionCleard(10052)local e=e.IsCleard"quest_q52035"return t and e
end
function t.quest_q52035()return TppStory.IsMissionCleard(10054)end
function t.quest_q52045()local t=TppStory.IsMissionCleard(10151)local e=e.IsCleard"quest_q52065"return t and e
end
function t.quest_q52055()local t=TppStory.IsMissionCleard(10093)local e=e.IsCleard"quest_q52045"return t and e
end
function t.quest_q52065()local t=TppStory.IsMissionCleard(10211)local e=e.IsCleard"quest_q52075"return t and e
end
function t.quest_q52075()return TppStory.IsMissionCleard(10090)end
function t.quest_q52085()local t=TppStory.IsMissionCleard(10151)local e=e.IsCleard"quest_q52015"return t and e
end
function t.quest_q52095()local t=TppStory.IsMissionCleard(10093)local e=e.IsCleard"quest_q52055"return t and e
end
function t.quest_q52105()local t=TppStory.IsMissionCleard(10171)local e=e.IsCleard"quest_q52095"return t and e
end
function t.quest_q52115()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"quest_q52105"return t and e
end
function t.quest_q52125()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"quest_q52115"return t and e
end
function t.quest_q52135()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"quest_q52085"return t and e
end
function t.quest_q52145()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"quest_q52135"return t and e
end
function t.ruins_q60010()return TppStory.IsMissionCleard(10054)end
function t.tent_q60011()local t=TppStory.IsMissionCleard(10052)local e=e.IsCleard"ruins_q60010"return t and e
end
function t.cliffTown_q60012()local t=e.IsCleard"tent_q99040"local e=e.IsCleard"fort_q60013"return t and e
end
function t.fort_q60013()local t=TppStory.IsMissionCleard(10091)local e=e.IsCleard"tent_q60011"return t and e
end
function t.sovietBase_q60014()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"cliffTown_q60012"return t and e
end
function t.pfCamp_q60020()local t=TppStory.IsMissionCleard(10211)local e=e.IsCleard"hill_q60021"return t and e
end
function t.hill_q60021()local t=TppStory.IsMissionCleard(10121)local e=e.IsCleard"outland_q60024"return t and e
end
function t.lab_q60022()local t=TppStory.IsMissionCleard(10280)local e=e.IsCleard"banana_q60023"return t and e
end
function t.banana_q60023()local t=TppStory.IsMissionCleard(10093)local e=e.IsCleard"pfCamp_q60020"return t and e
end
function t.outland_q60024()return TppStory.IsMissionCleard(10086)end
function t.Mtbs_SmokingSoldierCommand()return true
end
function t.Mtbs_SmokingSoldierCombat()return true
end
function t.Mtbs_child_dog()if TppDemo.IsPlayedMBEventDemo"EntrustDdog"then
return true
end
end
function t.Mtbs_ddog_walking()return false
end
function t.mtbs_q99050()local t=TppLocation.GetLocalMbStageClusterGrade(TppDefine.CLUSTER_DEFINE.Develop+1)>=2
local e=TppStory.IsMissionCleard"10211"return e and t
end
function t.mtbs_q99011()local e=TppBuddy2BlockController.DidObtainBuddyType(BuddyType.QUIET)local t=TppStory.IsMissionCleard(10086)local n=TppStory.IsNowOccurringElapsedMission(TppDefine.ELAPSED_MISSION_EVENT.QUIET_VISIT_MISSION)return(e and t)and n
end
function t.mtbs_wait_quiet()return false
end
function t.mtbs_return_quiet()return false
end
function t.mtbs_q101210()return true
end
function t.mtbs_q101220()return true
end
function t.mtbs_q99060()return TppDemo.IsPlayedMBEventDemo"PazPhantomPain1"end
function t.mtbs_q42010()return TppLocation.GetLocalMbStageClusterGrade(TppDefine.CLUSTER_DEFINE.Command+1)>=4
end
function t.mtbs_q42020()return TppLocation.GetLocalMbStageClusterGrade(TppDefine.CLUSTER_DEFINE.Develop+1)>0
end
function t.mtbs_q42030()return TppLocation.GetLocalMbStageClusterGrade(TppDefine.CLUSTER_DEFINE.Support+1)>0
end
function t.mtbs_q42040()return TppLocation.GetLocalMbStageClusterGrade(TppDefine.CLUSTER_DEFINE.BaseDev+1)>0
end
function t.mtbs_q42050()return TppLocation.GetLocalMbStageClusterGrade(TppDefine.CLUSTER_DEFINE.Medical+1)>0
end
function t.mtbs_q42060()return TppLocation.GetLocalMbStageClusterGrade(TppDefine.CLUSTER_DEFINE.Spy+1)>0
end
function t.mtbs_q42070()return TppLocation.GetLocalMbStageClusterGrade(TppDefine.CLUSTER_DEFINE.Combat+1)>0
end
e.ShootingPracticeOpenCondition={Command=t.mtbs_q42010,Develop=t.mtbs_q42020,Support=t.mtbs_q42030,BaseDev=t.mtbs_q42040,Medical=t.mtbs_q42050,Spy=t.mtbs_q42060,Combat=t.mtbs_q42070}function e.GetSideOpsListTable()local n={}if e.CanOpenSideOpsList()then
for i,t in ipairs(u)do
local s=t.questName
local a=e.IsActiveOnMBTerminal(t)local o=e.IsCleard(s)if t and(a or o)then
t.index=i
t.isActive=a
t.isCleard=o
t.gmp=e.GetBounusGMP(s)table.insert(n,t)end
end
end
table.insert(n,{allSideOpsNum=#u})return n
end
function e.GetBounusGMP(e)local e=TppDefine.QUEST_RANK_TABLE[TppDefine.QUEST_INDEX[e]]if e then
return TppDefine.QUEST_BONUS_GMP[e]end
return 0
end
function e.RegisterForceDeactiveOnMBTerminal(e)mvars.qst_forceDeactiveOnMBTerminal=e
end
function e.RegisterClusterForceDeactiveOnMBTerminal(e)mvars.qst_forceDeactiveClusterOnMBTerminal=e
end
function e.UnregisterForceDeactiveOnMBTerminal()mvars.qst_forceDeactiveOnMBTerminal={}end
function e.UnregisterClusterForceDeactiveOnMBTerminal()mvars.qst_forceDeactiveClusterOnMBTerminal=nil
end
function e.IsActiveOnMBTerminal(t)local n=t.questName
if mvars.qst_forceDeactiveOnMBTerminal then
for t,e in ipairs(mvars.qst_forceDeactiveOnMBTerminal)do
if e==n then
return false
end
end
end
if mvars.qst_forceDeactiveClusterOnMBTerminal then
if mvars.qst_forceDeactiveClusterOnMBTerminal==t.clusterId then
return false
end
end
return e.IsActive(n)end
function e.IsOpenLocation(e)if e==TppDefine.LOCATION_ID.MAFR then
return TppStory.GetCurrentStorySequence()>=TppDefine.STORY_SEQUENCE.CLEARD_RESCUE_HUEY
elseif e==TppDefine.LOCATION_ID.MTBS then
return true
end
return true
end
local r={}function r.mtbs_wait_quiet()return TppStory.CanArrivalQuietInMB()end
function r.Mtbs_child_dog()local t=TppBuddyService.CanSortieBuddyType(BuddyType.DOG)local e=not TppStory.IsNowOccurringElapsedMission(TppDefine.ELAPSED_MISSION_EVENT.D_DOG_GO_WITH_ME)return(not t)and e
end
function r.Mtbs_ddog_walking()local e=TppBuddyService.IsDeadBuddyType(BuddyType.DOG)return(not e)end
function r.cliffTown_q99080()local e=TppMotherBaseManagement.IsExistStaff{uniqueTypeId=110}local t=TppStory.IsMissionCleard(10240)return e or t
end
function e.SpecialMissionStartSetting(e)if(e==TppDefine.MISSION_CLEAR_TYPE.QUEST_BOSS_QUIET_BATTLE_END)then
TppPlayer.SetStartStatus(TppDefine.INITIAL_PLAYER_STATE.ON_FOOT)TppPlayer.ResetInitialPosition()TppPlayer.ResetMissionStartPosition()TppHelicopter.ResetMissionStartHelicopterRoute()TppPlayer.SetNoOrderBoxMissionStartPosition({-1868.27,343.22,-84.6095},160.651)TppMission.ResetIsStartFromHelispace()TppMission.SetIsStartFromFreePlay()elseif(e==TppDefine.MISSION_CLEAR_TYPE.QUEST_LOST_QUIET_END)then
gvars.heli_missionStartRoute=Fox.StrCode32"drp_s10260"TppPlayer.SetStartStatusRideOnHelicopter()TppPlayer.ResetInitialPosition()TppPlayer.ResetMissionStartPosition()TppPlayer.ResetNoOrderBoxMissionStartPosition()TppMission.ResetIsStartFromHelispace()TppMission.ResetIsStartFromFreePlay()elseif(e==TppDefine.MISSION_CLEAR_TYPE.QUEST_INTRO_RESCUE_EMERICH_END)then
TppPlayer.SetStartStatus(TppDefine.INITIAL_PLAYER_STATE.ON_FOOT)TppPlayer.ResetInitialPosition()TppPlayer.ResetMissionStartPosition()TppHelicopter.ResetMissionStartHelicopterRoute()TppPlayer.SetNoOrderBoxMissionStartPosition({-855.6097,515.6722,-1250.411},160.651)TppMission.ResetIsStartFromHelispace()TppMission.SetIsStartFromFreePlay()end
end
function e.RegisterCanActiveQuestListInMission(e)mvars.qst_canActiveQuestList=e
end
function e.RegisterQuestStepList(e)if not o(e)then
return
end
local t=#e
if t==0 then
return
end
if t>=m then
return
end
table.insert(e,d)mvars.qst_questStepList=Tpp.Enum(e)end
function e.RegisterQuestStepTable(e)if not o(e)then
return
end
e[d]={}mvars.qst_questStepTable=e
if mtbs_enemy and vars.missionCode==30050 then
mtbs_enemy.OnAllocateDemoBlock()end
end
function e.RegisterQuestSystemCallbacks(n)if not o(n)then
return
end
mvars.qst_systemCallbacks=mvars.qst_systemCallbacks or{}local function a(t,e)if l(t[e])then
mvars.qst_systemCallbacks[e]=t[e]end
end
local e={"OnActivate","OnOutOfAcitveArea","OnDeactivate","OnTerminate"}for t=1,#e do
a(n,e[t])end
end
function e.SetNextQuestStep(n)if not mvars.qst_questStepTable then
return
end
if not mvars.qst_questStepList then
return
end
local t=mvars.qst_questStepTable[n]local n=mvars.qst_questStepList[n]if t==nil then
return
end
if n==nil then
return
end
if e.IsInvoking()then
local e=e.GetQuestStepTable(gvars.qst_currentQuestStepNumber)local t=e.OnLeave
if l(t)then
t(e)end
end
gvars.qst_currentQuestStepNumber=n
local n=ScriptBlock.SCRIPT_BLOCK_STATE_ACTIVE
local e=e.GetQuestBlockState()if mvars.qst_allocated then
local e=t.OnEnter
if l(e)then
e(t)end
end
end
function e.ClearWithSave(t,n)if not n then
n=e.GetCurrentQuestName()end
local a=e.GetQuestIndex(n)if t==TppDefine.QUEST_CLEAR_TYPE.SHOOTING_CLEAR or t==TppDefine.QUEST_CLEAR_TYPE.SHOOTING_RETRY then
e.OnFinishShootingPractice(t)end
if t==TppDefine.QUEST_CLEAR_TYPE.CLEAR or t==TppDefine.QUEST_CLEAR_TYPE.SHOOTING_CLEAR then
if t~=TppDefine.QUEST_CLEAR_TYPE.SHOOTING_CLEAR then
e.AddStaffsFromTempBuffer()end
e.Clear(n)if t~=TppDefine.QUEST_CLEAR_TYPE.SHOOTING_CLEAR then
e.Save()end
elseif t==TppDefine.QUEST_CLEAR_TYPE.FAILURE then
e.AddStaffsFromTempBuffer()e.Failure(n)e.Save()elseif t==TppDefine.QUEST_CLEAR_TYPE.UPDATE then
e.Update(n)elseif t==TppDefine.QUEST_CLEAR_TYPE.SHOOTING_RETRY then
e.Retry(n)e.SetRetryShootingPracticeStartUi()end
end
function e.ClearWithSaveMtbsDDQuest()local t=e.GetCurrentQuestName()local t=e.GetQuestIndex(t)e.UpdateClearFlag(t,true)e.UpdateRepopFlag(t)e.Save()end
function e.Clear(t)if t==nil then
t=e.GetCurrentQuestName()if t==nil then
return
end
end
local n=e.GetQuestIndex(t)if n==nil then
return
end
e.SetNextQuestStep(d)e.ShowAnnounceLog(s.CLEAR,t)e.CheckClearBounus(n,t)e.UpdateClearFlag(n,true)e.UpdateRepopFlag(n)e.CheckAllClearBounus()e.CheckAllClearMineQuest()if not TppLocation.IsMotherBase()then
e.DecreaseElapsedClearCount(t)end
TppStory.UpdateStorySequence{updateTiming="OnSideOpsClear"}if not e.PlayClearRadio(t)then
e.GoToMBAfterClear(t)end
e.GetClearKeyItem(t)e.GetClearCassette(t)e.GetClearEmblem(t)if e.GetSideOpsInfo(t)then
TppTrophy.Unlock(15)end
TppUiCommand.SetSideOpsListUpdate()for n,e in ipairs(q)do
if t==e then
TppMotherBaseManagement.SetLockedTanFlag{locked=false}return
end
end
end
function e.GoToMBAfterClear(t)if not Tpp.IsNotAlert()then
return
end
if not TppMission.IsFreeMission(vars.missionCode)then
return
end
if vars.missionCode==30050 then
return
end
local e=TppStory.GetForceMBDemoNameOrRadioList("clearSideOpsForceMBDemo",{clearSideOpsName=t})if e then
TppMission.ReserveMissionClear{nextMissionId=TppDefine.SYS_MISSION_ID.MTBS_FREE,missionClearType=TppDefine.MISSION_CLEAR_TYPE.FORCE_GO_TO_MB_ON_SIDE_OPS_CLEAR}TppDemo.SetNextMBDemo(e)mvars.qst_currentClearQuestName=t
end
end
function e.Failure(t)if t==nil then
t=e.GetCurrentQuestName()if t==nil then
return
end
end
local n=e.GetQuestIndex(t)if n==nil then
return
end
e.UpdateClearFlag(n,false)e.SetNextQuestStep(d)e.ShowAnnounceLog(s.FAILURE,t)TppUiCommand.SetSideOpsListUpdate()for e=0,9,1 do
if gvars.qst_failedIndex[e]==-1 then
gvars.qst_failedIndex[e]=n
break
end
end
end
function e.Update(t)if t==nil then
t=e.GetCurrentQuestName()if t==nil then
return
end
end
local n=e.GetQuestIndex(t)if n==nil then
return
end
local i,o=TppEnemy.GetQuestCount()local n,a=TppGimmick.GetQuestShootingPracticeCount()if i>0 and o>1 then
e.ShowAnnounceLog(s.UPDATE,t,i,o)elseif n>0 and a>1 then
e.UpdateShootingPracticeUi()e.ShowAnnounceLog(s.UPDATE,t,n,a)end
end
function e.Retry(t)if t==nil then
t=e.GetCurrentQuestName()if t==nil then
return
end
end
local n=e.GetQuestIndex(t)if n==nil then
return
end
e.ShowAnnounceLog(s.FAILURE,t)end
function e.AddStaffsFromTempBuffer()local e=TppEnemy.IsQuestInHelicopter()if e then
TppTerminal.OnRecoverByHelicopterOnCheckPoint()end
TppTerminal.AddStaffsFromTempBuffer(true)end
function e.Save()TppSave.VarSaveQuest(vars.missionCode)TppSave.SaveGameData(vars.missionCode)end
function e.SetClearFlag(e)if e==nil then
return
end
local t=TppDefine.QUEST_INDEX[e]if gvars.qst_questClearedFlag[e]then
gvars.qst_questClearedFlag[t]=true
end
end
function e.ReserveOpenQuestDynamicUpdate()mvars.qst_reserveDynamicQuestOpen=true
end
function e.FadeOutAndDeativateQuestBlock()TppUI.FadeOut(TppUI.FADE_SPEED.FADE_NORMALSPEED,"FadeOutOnOutOfMissionArea")end
function e.SetQuestBlockName(e)mvars.qst_blockName=e
end
function e.GetQuestBlockName(e)return mvars.qst_blockName
end
function e.OnAllocate(t)e.SetDefaultQuestBlock()end
function e.Init(t)e.messageExecTable=Tpp.MakeMessageExecTable(e.Messages())end
function e.OnReload(t)e.messageExecTable=Tpp.MakeMessageExecTable(e.Messages())end
function e.Messages()local n=e.DeactiveQuestAreaTrapMessages()return O{Block={{msg="StageBlockCurrentSmallBlockIndexUpdated",func=e.OnUpdateSmallBlockIndex}},UI={{msg="EndFadeOut",sender="FadeOutOnOutOfMissionArea",func=function()mvars.qst_blockStateRequest=i.DEACTIVATE
TppUI.FadeIn(TppUI.FADE_SPEED.FADE_NORMALSPEED)end},{msg="QuestAreaAnnounceText",func=function(t)e.OnQuestAreaAnnounceText(t)end}},Marker={{msg="ChangeToEnable",func=function(s,a,n,t)e._ChangeToEnable(s,a,n,t)end}},Timer={{msg="Finish",sender="TimerShootingPracticeStart",func=function()e.StartShootingPractice()end,option={isExecMissionPrepare=true,isExecMissionClear=true}},{msg="Finish",sender="TimerShootingPracticeEnd",func=function()e.OnQuestShootingTimerEnd()end,option={isExecMissionPrepare=true,isExecMissionClear=true}},{msg="Finish",sender="TimerShootingPracticeRetryConfirm",func=function()TppGimmick.SetQuestShootingPracticeTargetInvisible()end,option={isExecMissionPrepare=true,isExecMissionClear=true}}},Trap=n}end
function e.OnMessage(a,r,i,t,n,s,o)Tpp.DoMessage(e.messageExecTable,TppMission.CheckMessageOption,a,r,i,t,n,s,o)local l=mvars.qst_questScriptBlockMessageExecTable
if l then
local e=o
local o
Tpp.DoMessage(l,TppMission.CheckMessageOption,a,r,i,t,n,s,e)end
if e.IsInvoking()and mvars.qst_questStepList then
local l=gvars.qst_currentQuestStepNumber
local e=e.GetQuestStepTable(l)if e then
local e=e._messageExecTable
if e then
local o=o
local l
Tpp.DoMessage(e,TppMission.CheckMessageOption,a,r,i,t,n,s,o)end
end
end
end
function e.OnDeactivate(t)if t.questType==TppDefine.QUEST_TYPE.SHOOTING_PRACTIVE then
e.OnFinishShootingPractice()e.ShootingPracticeStopAllTimer()e.OnQuestShootingTimerEnd()e.OnDeactivateShootingPracticeForUi()e.ClearShootingPracticeMvars()end
end
function e.RegisterQuestList(t)if not o(t)then
return
end
local n=#t
if n==0 then
return
end
for e=1,n do
if not o(t[e])then
return
end
local n=t[e].infoList
if not o(n)then
Tpp.DEBUG_DumpTable(t,2)return
end
if#n==0 then
return
end
for t,e in ipairs(n)do
if not f(e.name)then
return
end
if not f(e.invokeStepName)then
return
end
end
if not t[e].clusterName then
if not o(t[e].loadArea)then
return
end
if not o(t[e].activeArea)then
return
end
if not o(t[e].invokeArea)then
return
end
end
end
mvars.qst_questList=t
for n=1,n do
for n,t in ipairs(t[n].infoList)do
local t=t.name
if g(t)==gvars.qst_currentQuestName then
e.SetCurrentQuestName(t)end
end
end
return mvars.qst_questList
end
function e.RegisterQuestPackList(t,s)if not o(t)then
return
end
s=s or T
local o=TppLocation.IsMotherBase()local a={}for n,t in pairs(t)do
a[n]={}for s,t in pairs(t)do
if type(t)=="number"then
table.insert(a[n],t)elseif s=="faceIdList"then
local e=TppSoldierFace.GetFaceFpkFileCodeList{face=t,useHair=o}if e~=nil then
for t,e in ipairs(e)do
table.insert(a[n],e)end
end
elseif s=="bodyIdList"then
local e=TppSoldierFace.GetBodyFpkFileCodeList{body=t}if e~=nil then
for t,e in ipairs(e)do
table.insert(a[n],e)end
end
elseif s=="randomFaceList"then
if e.IsRandomFaceQuestName(n)then
if t.race and t.gender then
if TppMission.IsMissionStart()then
local a=(math.random(0,65535)*65536)+math.random(1,65535)local a=TppSoldierFace.CreateFaceTable{race=t.race,gender=t.gender,needCount=1,maxUsedFovaCount=1,seed=a}if a~=nil then
for a,t in ipairs(a)do
e.SetRandomFaceId(n,t)end
else
if t.gender==TppDefine.QUEST_GENDER_TYPE.MAN then
e.SetRandomFaceId(n,TppDefine.QUEST_FACE_ID_LIST.DEFAULT_MAN)elseif t.gender==TppDefine.QUEST_GENDER_TYPE.WOMAN then
e.SetRandomFaceId(n,TppDefine.QUEST_FACE_ID_LIST.DEFAULT_WOMAN)end
end
end
local e=e.GetRandomFaceId(n)local e={e}local e=TppSoldierFace.GetFaceFpkFileCodeList{face=e}if e~=nil then
for t,e in ipairs(e)do
table.insert(a[n],e)end
end
end
end
else
table.insert(a[n],t)end
end
end
TppScriptBlock.RegisterCommonBlockPackList(s,a)end
function e.SetDefaultQuestBlock()mvars.qst_blockName=T
end
function e.InitializeQuestLoad(t)local n=e.GetQuestBlockState()if n==nil then
return
end
if vars.missionCode==30050 and t==nil then
return
end
local a,n=Tpp.GetCurrentStageSmallBlockIndex()e.UpdateQuestBlockStateAtNotLoaded(a,n,t)end
function e.InitializeQuestActiveStatus(t)local n=e.GetQuestBlockState()if n==nil then
return
end
if n==ScriptBlock.SCRIPT_BLOCK_STATE_EMPTY then
return
end
mvars.qst_requestInitializeQuestActiveStatus=false
mvars.qst_requestInitializeQuestActiveCluster=nil
if n<ScriptBlock.SCRIPT_BLOCK_STATE_INACTIVE or not e._CanActivateQuest()then
mvars.qst_requestInitializeQuestActiveStatus=true
mvars.qst_requestInitializeQuestActiveCluster=t
return
end
local n=e.GetCurrentQuestTable()if n==nil then
return
end
local a,s=Tpp.GetCurrentStageSmallBlockIndex()if e.IsInsideArea("activeArea",n,a,s,t)then
e.ActivateCurrentQuestBlock()end
if not e.IsInvoking()then
if e.IsInsideArea("invokeArea",n,a,s,t)then
e.Invoke()end
else
gvars.qst_currentQuestStepNumber=1
local t=mvars.qst_questStepList[gvars.qst_currentQuestStepNumber]e.SetNextQuestStep(t)end
end
function e.DEBUG_Init()mvars.debug.showCurrentQuest=false;(nil).AddDebugMenu("LuaQuest","showCurrentQuest","bool",mvars.debug,"showCurrentQuest")mvars.debug.showQuestStatus=false;(nil).AddDebugMenu("LuaQuest","showQuestStatus","bool",mvars.debug,"showQuestStatus")mvars.debug.selectQuest=1;(nil).AddDebugMenu("LuaQuest","selectQuest","int32",mvars.debug,"selectQuest")mvars.debug.selectQuestIndex=1;(nil).AddDebugMenu("LuaQuest","selectQuestIndex","int32",mvars.debug,"selectQuestIndex")mvars.debug.historyQuestStep={}mvars.debug.showHistoryQuestStep=false;(nil).AddDebugMenu("LuaQuest","historyQuestStep","bool",mvars.debug,"showHistoryQuestStep")mvars.debug.updateActiveQuest=false;(nil).AddDebugMenu("LuaQuest","updateActiveQuest","bool",mvars.debug,"updateActiveQuest")mvars.debug.applyDebugFlags=false;(nil).AddDebugMenu("LuaQuest","applyDebugFlags","bool",mvars.debug,"applyDebugFlags")mvars.debug.updateOpenFlagSelectQuest=false;(nil).AddDebugMenu("LuaQuest"," dbgSetOpenFlag","bool",mvars.debug,"updateOpenFlagSelectQuest")mvars.debug.updateClearFlagSelectQuest=false;(nil).AddDebugMenu("LuaQuest"," dbgSetClearFlag","bool",mvars.debug,"updateClearFlagSelectQuest")mvars.debug.updateActiveFlagSelectQuest=false;(nil).AddDebugMenu("LuaQuest"," dbgSetActiveFlag","bool",mvars.debug,"updateActiveFlagSelectQuest")end
function e.DebugUpdate()local n=mvars
local a=(nil).Print
local t=(nil).NewContext()if n.debug.showCurrentQuest then
a(t,"")a(t,{.5,.5,1},"LuaQuest showCurrentQuest")a(t,"Current Area Name : "..tostring(e.GetCurrentAreaName()))a(t,"Current Quest Name : "..tostring(e.GetCurrentQuestName()))local i=e.GetQuestBlockState()local s={}s[ScriptBlock.SCRIPT_BLOCK_STATE_EMPTY]="EMPTY"s[ScriptBlock.SCRIPT_BLOCK_STATE_PROCESSING]="PROCESSING"s[ScriptBlock.SCRIPT_BLOCK_STATE_INACTIVE]="INACTIVE"s[ScriptBlock.SCRIPT_BLOCK_STATE_ACTIVE]="ACTIVE"a(t,"Quest block state : "..tostring(s[i]))a(t,"gvars.qst_currentQuestName : "..tostring(gvars.qst_currentQuestName))a(t,"gvars.qst_currentQuestStepNumber : "..tostring(gvars.qst_currentQuestStepNumber))do
local o={0,1,0}local r={1,0,0}local s="OK"local o=o
if not e.GetCurrentAreaName()or i<ScriptBlock.SCRIPT_BLOCK_STATE_INACTIVE then
s="---"elseif not n.qst_questStepTable then
s="No register quest step table! Please Check quest script!"o=r
end
a(t,o,"scriptStatus : "..s)end
end
if n.debug.showQuestStatus then
a(t,"")a(t,{.5,.5,1},"LuaQuest showQuestStatus")local s=n.debug.selectQuest
local o=n.debug.selectQuestIndex
if s>0 and o>0 then
local s=n.qst_questList[s]if s then
a(t,string.format("AreaName = %s",s.areaName))local n=s.infoList[o]if n then
a(t,string.format("name = %s",n.name))a(t,string.format("invokeStepName = %s",n.invokeStepName))if n.clusterName then
DebutTextPrint(t,string.format("clusterName  =%s",n.clusterName))else
local function a(a,n,e)local t=(nil).Print
t(a,string.format("%s = { %03d, %03d, %03d, %03d }",n,e[1],e[2],e[3],e[4]))end
local e={"loadArea","activeArea","invokeArea"}for n=1,#e do
local n=e[n]local e=s[n]if e then
a(t,n,e)end
end
end
a(t,"IsOpen : "..tostring(e.IsOpen(n.name)))a(t,"IsCleard : "..tostring(e.IsCleard(n.name)))a(t,"IsRepop : "..tostring(e.IsRepop(n.name)))a(t,"IsActive : "..tostring(e.IsActive(n.name)))else
a(t,"No define quest. index: "..tostring(o))end
end
end
end
if n.debug.showHistoryQuestStep then
a(t,"")a(t,{.5,.5,1},"LuaQuest historyQuestStep")local e=#n.debug.historyQuestStep
for e=1,e do
a(t,string.format("%03d: %s",e,n.debug.historyQuestStep[e]))end
end
if n.debug.updateActiveQuest then
e.UpdateActiveQuest{debugUpdate=true}e.OnUpdateSmallBlockIndex(Tpp.GetCurrentStageSmallBlockIndex())n.debug.updateActiveQuest=false
end
if n.debug.applyDebugFlags then
local s=n.debug.selectQuest
local e=n.debug.selectQuestIndex
if s>0 and e>0 then
local o=n.qst_questList[s]if o then
local s=o.infoList[e]if s then
local e=TppDefine.QUEST_INDEX[s.name]gvars.qst_questOpenFlag[e]=n.debug.updateOpenFlagSelectQuest
gvars.qst_questClearedFlag[e]=n.debug.updateClearFlagSelectQuest
gvars.qst_questActiveFlag[e]=n.debug.updateActiveFlagSelectQuest
if n.debug.updateActiveFlagSelectQuest then
for t,e in pairs(o.infoList)do
if e.name~=s.name then
local e=TppDefine.QUEST_INDEX[e.name]gvars.qst_questActiveFlag[e]=false
end
end
end
else
a(t,"No define quest. index: "..tostring(e))end
end
end
n.debug.applyDebugFlags=false
end
if n.debug.updateOpenFlagSelectQuest then
end
if n.debug.updateClearFlagSelectQuest then
end
if n.debug.updateActiveFlagSelectQuest then
end
end
function e.ShowAnnounceLogQuestOpen()if mvars.qst_isQuestNewOpenFlag==true then
mvars.qst_isQuestNewOpenFlag=false
e.ShowAnnounceLog(s.OPEN)end
end
function e.OnUpdateSmallBlockIndex(n,a,s)local t=e.GetQuestBlockState()if t==nil then
return
end
local o=ScriptBlock.SCRIPT_BLOCK_STATE_EMPTY
local i=ScriptBlock.SCRIPT_BLOCK_STATE_PROCESSING
local l=ScriptBlock.SCRIPT_BLOCK_STATE_INACTIVE
local r=ScriptBlock.SCRIPT_BLOCK_STATE_ACTIVE
mvars.qst_invokeReserveOnActivate=false
if(t==o)or(t==i)then
if mvars.qst_reserveDynamicQuestOpen then
e.UpdateOpenQuest()mvars.qst_reserveDynamicQuestOpen=false
end
e.UpdateQuestBlockStateAtNotLoaded(n,a,s)elseif(t==l)then
e.UpdateQuestBlockStateAtInactive(n,a,s)elseif(t==r)then
e.UpdateQuestBlockStateAtActive(n,a)end
end
function e.OnUpdateClusterIndex(n)local t=e.GetQuestBlockState()if t==nil then
return
end
if mvars.qst_reserveDynamicQuestOpen then
e.UpdateOpenQuest()mvars.qst_reserveDynamicQuestOpen=false
end
local e=e.UpdateQuestBlockStateAtNotLoaded(0,0,n)mvars.qst_skipTerminateFlag=e
return e
end
function e.UpdateQuestBlockStateAtNotLoaded(t,a,s)if not mvars.qst_questList then
return
end
local n=e.GetCurrentQuestName()local t=e.SearchQuestFromAllSpecifiedArea("loadArea",t,a,s)if t==nil then
e.UnloadCurrentQuestBlock()e.ClearCurrentQuestName()e.ResetQuestStatus()end
if n then
local s=e.GetQuestBlockState()local a=ScriptBlock.SCRIPT_BLOCK_STATE_EMPTY
if t then
if(s==a or n~=t)then
e.SetNewQuestAndLoadQuestBlock(t)end
if(s~=a)and(n==t)then
mvars.qst_currentQuestTable=e.GetQuestTable(t)end
end
else
if t then
e.SetNewQuestAndLoadQuestBlock(t)end
end
return t
end
function e.UpdateQuestBlockStateAtInactive(a,n)local t=e.GetCurrentQuestTable()if not e.IsInsideArea("loadArea",t,a,n)then
e.UnloadCurrentQuestBlock()return
end
if e.IsInsideArea("activeArea",t,a,n)then
if not e.IsInvoking()then
if e.IsInsideArea("invokeArea",t,a,n)then
mvars.qst_invokeReserveOnActivate=true
end
end
mvars.qst_blockStateRequest=i.ACTIVATE
return
end
end
function e.UpdateQuestBlockStateAtActive(t,n)local a=e.GetCurrentQuestTable()if not e.IsInsideArea("activeArea",a,t,n)then
if mvars.qst_blockStateRequest~=i.DEACTIVATING then
mvars.qst_blockStateRequest=i.DEACTIVATING
local e=e.ExecuteSystemCallback"OnOutOfAcitveArea"if not e then
mvars.qst_blockStateRequest=i.DEACTIVATE
end
end
return
end
if not e.IsInvoking()then
if e.IsInsideArea("invokeArea",a,t,n)then
e.Invoke()end
end
end
function e.QuestBlockOnInitialize(t)local t=t.Messages
if l(t)then
local e=t()mvars.qst_questScriptBlockMessageExecTable=Tpp.MakeMessageExecTable(e)end
e.MakeQuestStepMessageExecTable()mvars.qst_skipTerminateFlag=nil
mvars.qst_isRadioTarget=false
end
function e.QuestBlockOnTerminate()e.ExecuteSystemCallback"OnTerminate"mvars.qst_systemCallbacks=nil
mvars.qst_lastQuestBlockState=nil
mvars.qst_questStepList=nil
mvars.qst_questStepTable=nil
mvars.qst_isRadioTarget=false
gvars.qst_currentQuestStepNumber=c
if mtbs_enemy and vars.missionCode==30050 then
mtbs_enemy.OnTerminateDemoBlock()end
if not mvars.qst_skipTerminateFlag then
mvars.qst_currentQuestTable=nil
e.ClearCurrentQuestName()local e=ScriptBlock.GetScriptBlockId(mvars.qst_blockName)TppScriptBlock.FinalizeScriptBlockState(e)end
end
function e._CanActivateQuest()if mvars.ene_isQuestHeli then
return not TppReinforceBlock.IsProcessing()end
return true
end
function e.QuestBlockOnUpdate()local t=e
local a=t.GetQuestBlockState()if a==nil then
return
end
local n=ScriptBlock
local e=mvars
local s=e.qst_lastQuestBlockState
local o=n.SCRIPT_BLOCK_STATE_INACTIVE
local n=n.SCRIPT_BLOCK_STATE_ACTIVE
if e.qst_requestInitializeQuestActiveStatus then
t.InitializeQuestActiveStatus(e.qst_requestInitializeQuestActiveCluster)return
end
if a==o then
if s==n then
t._DoDeactivate()end
if e.qst_blockStateRequest==i.ACTIVATE then
if t._CanActivateQuest()then
t.ActivateCurrentQuestBlock()t.ClearBlockStateRequest()end
end
e.qst_lastInactiveToActive=false
elseif a==n then
if not t._CanActivateQuest()then
return
end
local n
if t.IsInvoking()then
n=t.GetQuestStepTable(gvars.qst_currentQuestStepNumber)end
if e.qst_lastInactiveToActive then
e.qst_lastInactiveToActive=false
e.qst_deactivated=false
t.ExecuteSystemCallback"OnActivate"e.qst_allocated=true
if e.qst_invokeReserveOnActivate then
e.qst_invokeReserveOnActivate=false
t.Invoke()n=t.GetQuestStepTable(gvars.qst_currentQuestStepNumber)end
if n and l(n.OnEnter)then
n.OnEnter(n)end
end
if(not s)or s<=o then
e.qst_lastInactiveToActive=true
end
if n and l(n.OnUpdate)then
n.OnUpdate(n)end
if e.qst_blockStateRequest==i.DEACTIVATE then
t.DeactivateCurrentQuestBlock()t.ClearBlockStateRequest()end
else
e.qst_lastInactiveToActive=false
t.ClearBlockStateRequest()end
e.qst_lastQuestBlockState=a
end
function e.OnMissionGameEnd()local t=e.GetQuestBlockState()mvars.qst_isMissionEnd=true
if t==ScriptBlock.SCRIPT_BLOCK_STATE_ACTIVE then
e._DoDeactivate()end
end
function e.ClearBlockStateRequest()mvars.qst_blockStateRequest=i.NONE
end
function e.Invoke()local t=e.GetCurrentQuestName()local n,t=e.GetQuestTable(t)local t=t.invokeStepName
e.SetNextQuestStep(t)end
function e.SetNewQuestAndLoadQuestBlock(t)if TppLocation.IsMotherBase()then
f30050_demo.UpdatePackList(t)end
local n=TppScriptBlock.Load(mvars.qst_blockName,t)if n==false then
return
end
e.ResetQuestStatus()e.SetCurrentQuestName(t)mvars.qst_currentQuestTable=e.GetQuestTable(t)end
function e.GetCurrentQuestName()return mvars.qst_currentQuestName
end
function e.GetCurrentAreaName()local e=e.GetCurrentQuestTable()if e then
return e.areaName
else
return nil
end
end
function e.SetCurrentQuestName(e)mvars.qst_currentQuestName=e
gvars.qst_currentQuestName=Fox.StrCode32(e)end
function e.ClearCurrentQuestName()mvars.qst_currentQuestName=nil
gvars.qst_currentQuestName=I
end
function e.ResetQuestStatus()gvars.qst_currentQuestName=I
gvars.qst_currentQuestStepNumber=c
end
function e.UnloadCurrentQuestBlock()TppScriptBlock.Unload(mvars.qst_blockName)end
function e.ActivateCurrentQuestBlock()local e=ScriptBlock.GetScriptBlockId(mvars.qst_blockName)TppScriptBlock.ActivateScriptBlockState(e)end
function e.DeactivateCurrentQuestBlock()local e=ScriptBlock.GetScriptBlockId(mvars.qst_blockName)TppScriptBlock.DeactivateScriptBlockState(e)end
function e.SearchQuestFromAllSpecifiedArea(s,o,a,n)local t=#mvars.qst_questList
for t=1,t do
local t=mvars.qst_questList[t]if e.IsInsideArea(s,t,o,a,n)then
local n={}for n,t in ipairs(t.infoList)do
local t=t.name
if e.IsActive(t)then
return t
end
end
end
end
end
function e.IsInsideArea(t,e,n,a,s)do
local t=TppPackList.GetLocationNameFormMissionCode(vars.missionCode)local t=TppDefine.LOCATION_ID[t]if e.locationId~=t then
return false
end
end
if e.clusterName then
return TppDefine.CLUSTER_NAME[s]==e.clusterName
else
local s=e.areaName
local e=e[t]if e==nil then
return
end
return Tpp.CheckBlockArea(e,n,a)end
end
function e.GetCurrentQuestTable()return mvars.qst_currentQuestTable
end
function e.GetQuestTable(n)local e=#mvars.qst_questList
for e=1,e do
local t=mvars.qst_questList[e]for a,e in ipairs(t.infoList)do
if e.name==n then
return t,e
end
end
end
end
function e.GetQuestIndex(e)local e=TppDefine.QUEST_INDEX[e]if e then
return e
else
return
end
end
function e.GetSideOpsInfo(t)for n,e in ipairs(u)do
if e.questName==t then
return e
end
end
return nil
end
function e.IsShowSideOpsList(t)return e.GetSideOpsInfo()~=nil
end
function e.GetQuestNameLangId(t)local e=e.GetSideOpsInfo(t)if e then
local e="name_"..string.sub(e.questId,-6)return e
end
return false
end
function e.GetQuestNameId(t)local e=e.GetSideOpsInfo(t)if e then
local e=string.sub(e.questId,-6)return e
end
return false
end
function e.GetQuestName(t)for n,e in ipairs(u)do
local n=tonumber(string.sub(e.questId,-5))if t==n then
return e.questName
end
end
end
function e.ExecuteSystemCallback(e)if mvars.qst_systemCallbacks==nil then
return
end
local e=mvars.qst_systemCallbacks[e]if e then
return e()end
end
function e.IsInvoking()if gvars.qst_currentQuestStepNumber~=c then
return true
else
return false
end
end
function e.UpdateOpenQuest()mvars.qst_isQuestNewOpenFlag=false
for n,e in pairs(TppDefine.QUEST_INDEX)do
local t=t[n]if t then
if t()then
if gvars.qst_questOpenFlag[e]==false then
mvars.qst_isQuestNewOpenFlag=true
end
gvars.qst_questOpenFlag[e]=true
end
end
end
end
function e.UpdateActiveQuest(t)if not mvars.qst_questList then
return
end
if e.NeedUpdateActiveQuest(t)then
e.UpdateOpenQuest()for n,t in ipairs(mvars.qst_questList)do
local n=nil
local n={}local o={}local n={}local s={}for t,i in ipairs(t.infoList)do
local t=i.name
local a=TppDefine.QUEST_INDEX[t]if a then
gvars.qst_questActiveFlag[a]=false
local a=r[t]if e.IsOpen(t)and(not a or a())then
if not e.IsCleard(t)then
if i.isStory then
table.insert(o,t)else
table.insert(n,t)end
elseif e.IsRepop(t)then
table.insert(s,t)end
end
end
end
local e=nil
for n,t in ipairs{o,n,s}do
if not e then
e=t[1]end
end
if e then
gvars.qst_questActiveFlag[TppDefine.QUEST_INDEX[e]]=true
end
end
elseif TppMission.IsStoryMission(vars.missionCode)then
for n,t in ipairs(TppDefine.QUEST_DEFINE)do
if not e.CanActiveQuestInMission(vars.missionCode,t)then
gvars.qst_questActiveFlag[TppDefine.QUEST_INDEX[t]]=false
end
end
else
for e=0,9,1 do
if gvars.qst_failedIndex[e]~=-1 then
local t=gvars.qst_failedIndex[e]gvars.qst_questActiveFlag[t]=true
gvars.qst_failedIndex[e]=-1
end
end
end
for e=0,9,1 do
gvars.qst_failedIndex[e]=-1
end
TppUiCommand.SetSideOpsListUpdate()for t,e in ipairs(q)do
if gvars.qst_questActiveFlag[TppDefine.QUEST_INDEX[e]]==true then
TppMotherBaseManagement.SetLockedTanFlag{locked=true}return
end
end
end
function e.CanActiveQuestInMission(t,e)if(not TppMission.IsStoryMission(t))then
return true
else
if mvars.qst_canActiveQuestList then
for n,t in ipairs(mvars.qst_canActiveQuestList)do
if t==e then
return true
end
end
end
return false
end
end
function e.IsImportant(t)local e=e.GetSideOpsInfo(t)if e then
return e.isImportant
end
return false
end
local a={waterway_q99012="waterway",tent_q99040="tent",tent_q20910="tent",sovietBase_q20912="waterway",fort_q20911="fort"}function e.OpenAndActivateSpecialQuest(n)local t=true
for a,n in ipairs(n)do
if e.CanOpenAndActivateSpecialQuest(n)then
e.OpenQuestForce(n)e.SwitchActiveQuest(n)e.AddStaffsFromTempBuffer()e.Save()else
t=false
end
end
if t then
e.ShowAnnounceLog(s.OPEN)end
return t
end
function e.OpenQuestForce(e)local e=TppDefine.QUEST_INDEX[e]if e then
gvars.qst_questOpenFlag[e]=true
end
end
function e.CanOpenAndActivateSpecialQuest(t)local n=a[t]if not n then
return false
end
for a,t in ipairs(TppQuestList.questList)do
if t.areaName==n then
local n=TppPackList.GetLocationNameFormMissionCode(vars.missionCode)local n=TppDefine.LOCATION_ID[n]if t.locationId~=n then
return true
end
local a,n=Tpp.GetCurrentStageSmallBlockIndex()if not e.IsInsideArea("loadArea",t,a,n)then
return true
end
end
end
return false
end
function e.SwitchActiveQuest(t)local e=a[t]if not e then
return
end
for a,n in ipairs(TppQuestList.questList)do
if n.areaName==e then
for n,e in ipairs(n.infoList)do
local n=e.name
local e=TppDefine.QUEST_INDEX[n]if e then
gvars.qst_questActiveFlag[e]=(n==t)end
end
end
end
end
function e.IsRepop(e)local e=TppDefine.QUEST_INDEX[e]if e then
return gvars.qst_questRepopFlag[e]end
end
function e.IsOpen(e)local e=TppDefine.QUEST_INDEX[e]if e then
return gvars.qst_questOpenFlag[e]end
end
function e.IsActive(e)local e=TppDefine.QUEST_INDEX[e]if e then
return gvars.qst_questActiveFlag[e]end
end
function e.IsCleard(e)local e=TppDefine.QUEST_INDEX[e]if e then
return gvars.qst_questClearedFlag[e]end
end
function e.IsEnd(t)if t==nil then
t=e.GetCurrentQuestName()if t==nil then
return
end
end
if mvars.qst_questStepList[gvars.qst_currentQuestStepNumber]==d then
return true
end
return false
end
function e._DoDeactivate()mvars.qst_deactivated=true
e.ExecuteSystemCallback"OnDeactivate"mvars.qst_allocated=false
end
function e.MakeQuestStepMessageExecTable()if not o(mvars.qst_questStepTable)then
return
end
for t,e in pairs(mvars.qst_questStepTable)do
local t=e.Messages
if l(t)then
local t=t(e)e._messageExecTable=Tpp.MakeMessageExecTable(t)end
end
end
function e.GetQuestStepTable(e)if mvars.qst_questStepList==nil then
return
end
local e=mvars.qst_questStepList[e]if e==nil then
return
end
local e=mvars.qst_questStepTable[e]if e~=nil then
return e
else
return
end
end
function e.GetQuestBlockState()local e=ScriptBlock.GetScriptBlockId(mvars.qst_blockName)if e==ScriptBlock.SCRIPT_BLOCK_ID_INVALID then
return
end
return ScriptBlock.GetScriptBlockState(e)end
function e.CheckClearBounus(e,t)local e=TppDefine.QUEST_RANK_TABLE[e]local t=TppDefine.QUEST_BONUS_GMP[e]if e then
TppHero.SetAndAnnounceHeroicOgrePointForQuestClear(e)TppTerminal.UpdateGMP{gmp=t,gmpCostType=TppDefine.GMP_COST_TYPE.CLEAR_SIDE_OPS}end
end
function e.UpdateClearFlag(e,t)if t then
gvars.qst_questClearedFlag[e]=true
end
gvars.qst_questActiveFlag[e]=false
end
function e.UpdateRepopFlag(t)gvars.qst_questRepopFlag[t]=false
local t=e.GetCurrentQuestTable()if not t then
return
end
e.UpdateRepopFlagImpl(t)end
function e.UpdateRepopFlagImpl(a)local n=0
for t,a in ipairs(a.infoList)do
local t=a.name
if e.IsOpen(t)then
if not a.isOnce then
n=n+1
end
if e.IsRepop(t)or not e.IsCleard(t)then
local e=r[t]if(e==nil)or e()then
return
end
end
end
end
if n<=1 and(not TppLocation.IsMotherBase())then
return
end
for n,t in ipairs(a.infoList)do
if e.IsCleard(t.name)and not t.isOnce then
gvars.qst_questRepopFlag[TppDefine.QUEST_INDEX[t.name]]=true
end
local e=r[t.name]if e and(not e())then
gvars.qst_questRepopFlag[TppDefine.QUEST_INDEX[t.name]]=false
end
end
end
function e.CheckAllClearBounus()if gvars.qst_allQuestCleared then
TppTrophy.UnlockOnAllQuestClear()return
end
local e=true
for n,t in ipairs(u)do
local t=t.questName
local t=TppDefine.QUEST_INDEX[t]if not gvars.qst_questClearedFlag[t]then
e=false
break
end
end
if e then
gvars.qst_allQuestCleared=true
TppTrophy.UnlockOnAllQuestClear()TppHero.SetAndAnnounceHeroicOgrePoint(TppHero.QUEST_ALL_CLEAR)end
end
function e.CalcQuestClearedCount()local e=0
local t=0
for a,n in ipairs(u)do
local n=n.questName
local n=TppDefine.QUEST_INDEX[n]if gvars.qst_questClearedFlag[n]then
e=e+1
end
t=t+1
end
return e,t
end
function e.CheckAllClearMineQuest()if gvars.qst_allQuestCleared then
TppTrophy.Unlock(16)return
end
local e=true
for t,n in pairs(TppDefine.REMOVAL_TROPHY_QUEST)do
local t=gvars.qst_questClearedFlag[TppDefine.QUEST_INDEX[t]]if not t then
e=false
break
end
end
if e then
TppTrophy.Unlock(16)TppHero.SetAndAnnounceHeroicOgrePoint(TppHero.MINE_QUEST_ALL_CLEAR)end
end
function e.NeedUpdateActiveQuest(t)if not e.CanOpenSideOpsList()then
return false
end
if not TppMission.IsMissionStart()then
return false
end
return not TppMission.IsStoryMission(vars.missionCode)end
function e.CanOpenSideOpsList()if TppMission.IsFOBMission(vars.missionCode)then
return false
end
local e={10033,10036,10043}return(TppStory.GetClearedMissionCount(e)>=1)or(gvars.str_storySequence>TppDefine.STORY_SEQUENCE.CLEARD_TO_MATHER_BASE)end
function e.StartElapsedEvent(e)gvars.qst_elapseCount=e
end
function e.IsNowOccurringElapsed()return gvars.qst_elapseCount==TppDefine.ELAPSED_QUEST_COUNT.NOW_OCCURRING
end
function e.SetDoneElapsed()gvars.qst_elapseCount=TppDefine.ELAPSED_QUEST_COUNT.DONE_EVENT
end
local t={waterway_q99010=true,waterway_q99012=true,sovietBase_q99020=true}function e.DecreaseElapsedClearCount(e)if gvars.qst_elapseCount<=1 then
if not Tpp.IsNotAlert()then
return
end
if not TppMission.IsFreeMission(vars.missionCode)then
return
end
end
if t[e]then
return
end
if gvars.qst_elapseCount>TppDefine.ELAPSED_QUEST_COUNT.NOW_OCCURRING then
gvars.qst_elapseCount=gvars.qst_elapseCount-1
end
end
function e.PlayClearRadio(e)if Tpp.IsNotAlert()then
local e=TppStory.GetForceMBDemoNameOrRadioList("clearSideOps",{clearSideOpsName=e})if e then
TppRadio.Play(e)return true
end
end
return false
end
function e.GetClearKeyItem(t)for e,n in pairs(A)do
if e==t then
TppTerminal.AcquireKeyItem{dataBaseId=n,isShowAnnounceLog=true}for t,n in pairs(S)do
if e==t then
TppUI.ShowAnnounceLog("quest_get_photo",n)end
end
end
end
end
function e.GetClearEmblem(e)local e=C[e]if e then
for t,e in ipairs(e)do
TppEmblem.Add(e,false,true)end
end
end
function e.GetClearCassette(t)local n={"outland_q20913","lab_q20914","tent_q20910","sovietBase_q20912","fort_q20911"}local a={{"tp_m_10160_06"},{"tp_m_10160_07"},{"tp_m_10160_08"},{"tp_m_10160_09","tp_m_10160_10"}}if(((t=="outland_q20913"or t=="lab_q20914")or t=="tent_q20910")or t=="sovietBase_q20912")or t=="fort_q20911"then
local t=0
for a,n in ipairs(n)do
if e.IsCleard(n)then
t=t+1
end
end
local e=a[t]if e then
TppCassette.Acquire{cassetteList=e,isShowAnnounceLog=true}end
elseif t=="sovietBase_q99030"then
TppCassette.Acquire{cassetteList={"tp_m_10150_20","tp_m_10150_29","tp_m_10150_30"},isShowAnnounceLog=true}elseif t=="tent_q99040"then
TppCassette.Acquire{cassetteList={"tp_m_10150_21","tp_m_10150_22","tp_m_10150_24","tp_m_10150_25"},isShowAnnounceLog=true}end
end
function e.ShowAnnounceLog(n,t,i,l)if not n then
return
end
if n==s.OPEN then
TppUI.ShowAnnounceLog"quest_list_update"TppUI.ShowAnnounceLog"quest_add"elseif n==s.CLEAR then
if not t then
return
end
local s=e.GetQuestNameLangId(t)if s~=false then
local n=_[t]local o,r=TppEnemy.GetQuestCount()local a,i=TppGimmick.GetQuestShootingPracticeCount()if n then
if o>1 then
TppUI.ShowAnnounceLog(n,o,r)elseif a>1 then
TppUI.ShowAnnounceLog(n,a,i)end
end
TppUI.ShowAnnounceLog"quest_list_update"TppUI.ShowAnnounceLog("quest_complete",s)local e=e.GetQuestNameId(t)if(e~=false)and(e~="q99012")then
TppUiCommand.ShowSideFobInfo("end",string.format("name_%s",e),"hud_quest_finish")TppSoundDaemon.PostEvent"sfx_s_sideops_sted"end
end
elseif n==s.FAILURE then
if not t then
return
end
local e=e.GetQuestNameLangId(t)if e~=false then
TppUI.ShowAnnounceLog"quest_list_update"TppUI.ShowAnnounceLog("quest_delete",e)end
elseif n==s.UPDATE then
if not t then
return
end
local e=_[t]if e then
TppUI.ShowAnnounceLog(e,i,l)end
end
end
function e.IsRandomFaceQuestName(t)if t==nil then
t=e.GetCurrentQuestName()if t==nil then
return
end
end
local e=TppDefine.QUEST_RANDOM_FACE_INDEX[t]if e then
return true
end
return false
end
function e.GetRandomFaceId(t)if t==nil then
t=e.GetCurrentQuestName()if t==nil then
return
end
end
local e=TppDefine.QUEST_RANDOM_FACE_INDEX[t]if e then
return gvars.qst_randomFaceId[e]end
end
function e.SetRandomFaceId(e,t)local e=TppDefine.QUEST_RANDOM_FACE_INDEX[e]if e then
gvars.qst_randomFaceId[e]=t
end
end
function e.OnQuestAreaAnnounceText(t)local n=e.GetQuestName(t)local t
if n then
for a,e in pairs(h)do
if a==n then
if e.radioNameFirst then
if e.radioNameSecond then
if TppRadio.IsPlayed(e.radioNameFirst)then
t=e.radioNameSecond
else
t=e.radioNameFirst
end
else
t=e.radioNameFirst
end
end
end
end
if t~=nil then
TppRadio.Play(t,{delayTime="mid"})end
TppSoundDaemon.PostEvent"sfx_s_sideops_sted"end
end
function e.IsActiveQuestHeli()for n,t in ipairs(TppDefine.QUEST_HELI_DEFINE)do
if e.IsActive(t)then
return true
end
end
return false
end
function e.DeactiveQuestAreaTrapMessages()local n={}local t={}local a=TppMission.GetMissionID()if a==30010 then
t=N
elseif a==30020 then
t=D
else
return
end
for a,t in ipairs(t)do
local e=e.GetTrapName(t)local e={msg="Exit",sender=e,func=function(e,e)TppEnemy.CheckDeactiveQuestAreaForceFulton()end}table.insert(n,e)end
return n
end
function e.GetTrapName(e)return"trap_preDeactiveQuestArea_"..e
end
function e._ChangeToEnable(a,a,t,n)if n==Fox.StrCode32"Player"and e.IsInvoking()then
local n=TppEnemy.IsQuestTarget(t)local a=TppGimmick.IsQuestTarget(t)local t=TppAnimal.IsQuestTarget(t)if(n or a)or t then
TppSoundDaemon.PostEvent"sfx_s_enemytag_quest_tgt"if mvars.qst_isRadioTarget==false then
local e=e.GetCurrentQuestName()if(((e=="tent_q20910"or e=="fort_q20911")or e=="sovietBase_q20912")or e=="outland_q20913")or e=="lab_q20914"then
TppRadio.Play("f2000_rtrg8330",{delayTime="short"})else
TppRadio.Play("f1000_rtrg2180",{delayTime="short"})end
mvars.qst_isRadioTarget=true
end
end
end
end
function e.SetQuestShootingPractice()TppSoundDaemon.PostEvent"sfx_s_training_ready_go"GkEventTimerManager.Start("TimerShootingPracticeStart",3.5)e.StopTimer"TimerShootingPracticeRetryConfirm"e.HideShootingPracticeStartUi()mvars.qst_isShootingPracticeStarted=true
GameObject.SendCommand({type="TppHeli2",index=0},{id="PullOut"})end
function e.StartShootingPractice()e.UpdateShootingPracticeUi()TppUiCommand.StartDisplayTimer(mvars.gim_questDisplayTimeSec,mvars.gim_questCautionTimeSec)TppGimmick.StartQuestShootingPractice()TppGimmick.SetQuestSootingTargetInvincible(false)f30050_sound.SetScene_ShootingRange()TppSoundDaemon.PostEvent"sfx_m_tra_tgt_get_up_alot"Player.SetInfiniteAmmoFromScript(true)end
function e.OnFinishShootingPractice(n,t)if n or t then
e.ProcessFinishShootingPractice(n,t)end
Player.SetInfiniteAmmoFromScript(false)mvars.qst_isShootingPracticeStarted=false
end
function e.IsShootingPracticeStarted()if not mvars.qst_isShootingPracticeStarted then
return false
end
return true
end
function e.IsShootingPracticeActivated()if not mvars.isShootingPracticeQuestActivated then
return false
end
return true
end
function e.ProcessFinishShootingPractice(t,n)e.UpdateShootingPracticeUi()TppUiStatusManager.SetStatus("DisplayTimer","STOP_VISIBLE")e.StartSafeTimer("TimerShootingPracticeEnd",8)TppSound.StopSceneBGM()if mvars.isShootingPracticeInMedicalStopMusicFromQuietRoom==true then
f30050_sequence.PlayMusicFromQuietRoom()mvars.isShootingPracticeInMedicalStopMusicFromQuietRoom=false
end
if n then
TppGimmick.EndQuestShootingPractice(TppDefine.QUEST_CLEAR_TYPE.SHOOTING_RETRY)TppGimmick.SetQuestShootingPracticeTargetInvisible()else
TppGimmick.EndQuestShootingPractice(t)if mvars.qst_deactivated==false then
if vars.playerVehicleGameObjectId==GameObject.NULL_ID then
TppPlayer.PlayMissionClearCameraOnFoot(2,true)end
if t==TppDefine.QUEST_CLEAR_TYPE.SHOOTING_CLEAR then
TppMusicManager.PostJingleEvent("SingleShot","Play_bgm_training_jingle_clear")TppGimmick.SetQuestShootingPracticeTargetInvisible()else
TppMusicManager.PostJingleEvent("SingleShot","Play_bgm_training_jingle_failed")e.StartSafeTimer("TimerShootingPracticeRetryConfirm",60)TppGimmick.SetQuestSootingTargetInvincible(true)end
end
end
end
function e.CancelShootingPractice()local t=e.GetCurrentQuestName()e.ShowAnnounceLog(s.FAILURE,t)e.OnFinishShootingPractice(nil,true)e.ShootingPracticeStopAllTimer()e.OnQuestShootingTimerEnd()e.SetCancelShootingPracticeStartUi()end
function e.StartSafeTimer(t,n)e.StopTimer(t)GkEventTimerManager.Start(t,n)end
function e.StopTimer(e)if GkEventTimerManager.IsTimerActive(e)then
GkEventTimerManager.Stop(e)end
end
function e.ShootingPracticeStopAllTimer()e.StopTimer"TimerShootingPracticeEnd"e.StopTimer"TimerShootingPracticeRetryConfirm"e.StopTimer"TimerShootingPracticeStart"end
function e.OnQuestShootingTimerEnd()TppUiStatusManager.UnsetStatus("DisplayTimer","STOP_VISIBLE")TppUiCommand.EraseDisplayTimer()end
function e.ShowShootingPracticeStartUi(t,n)e.ShowShootingPracticeGroundUi(t,n)e.ShowShootingPracticeMarker(t)end
function e.ShowShootingPracticeGroundUi(e,t)mvars.qst_shootingPracticeStartUiPos=t or mvars.qst_shootingPracticeStartUiPos
mvars.qst_shootingPracticeOffsetType=e or mvars.qst_shootingPracticeOffsetType
local e,t=mtbs_cluster.GetPosAndRotY(mvars.qst_shootingPracticeOffsetType,"plnt0",mvars.qst_shootingPracticeStartUiPos,0)TppUiCommand.SetMbStageSpot("show",Vector3(e[1],e[2],e[3]))end
function e.ShowShootingPracticeMarker(e)if e then
for n,t in pairs(p)do
if n~=e then
TppMarker.Disable(t)else
mvars.qst_shootingPracticeMarkerName=t or mvars.qst_shootingPracticeMarkerName
end
end
end
if Tpp.IsHelicopter(vars.playerVehicleGameObjectId)then
return
end
if mvars.qst_shootingPracticeMarkerName then
TppMarker.Enable(mvars.qst_shootingPracticeMarkerName)end
end
function e.HideShootingPracticeStartUi()TppUiCommand.SetMbStageSpot"hide"e.HideShootingPracticeMarker()end
function e.HideShootingPracticeMarker()if mvars.qst_shootingPracticeMarkerName then
TppMarker.Disable(mvars.qst_shootingPracticeMarkerName)end
end
function e.OnDeactivateShootingPracticeForUi()e.HideAllShootingPracticeForUi()end
function e.ClearShootingPracticeMvars()mvars.qst_shootingPracticeStartUiPos=nil
mvars.qst_shootingPracticeOffsetType=nil
mvars.qst_shootingPracticeMarkerName=nil
mvars.qst_isShootingPracticeStarted=false
end
function e.HideAllShootingPracticeForUi()for t,e in pairs(p)do
local t=GameObject.GetGameObjectId(e)if t~=GameObject.NULL_ID then
TppMarker.Disable(e)end
end
end
function e.SetRetryShootingPracticeStartUi()e.ShowShootingPracticeStartUi()TppPlayer.ResetIconForQuest"ShootingPractice"end
function e.SetCancelShootingPracticeStartUi()e.ShowShootingPracticeGroundUi()TppPlayer.ResetIconForQuest"ShootingPractice"end
function e.UpdateShootingPracticeUi()local e,t=TppGimmick.GetQuestShootingPracticeCount()TppUiCommand.SetDisplayTimerText("time_quest",e,t)end
return e