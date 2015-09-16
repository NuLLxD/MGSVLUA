#Updates

* Updated list of functions
* Added updated dictionary
* Updated functions
* Added secondary package method
* Added new QAR Tool
* Added new LUA edits
* Added new packaging method

###Lua files in repository already contain edits.

Edits included;
* All Unlockables - EquipDevelopConstSetting.lua
* All Soldiers S++ Rank - MbmCommonSetting.lua
* Instant Weapon Development - EquipDevelopFlowSetting.lua
* Easy S Rank Missions // TPPResults.LUA
* Remove rank restriction on items // TPPResults.LUA

Note: To use any of my edits I recommend using the QAR tool and dictionary provided in the QAR folder.

**Important**

As of MGSV:TPP v1.0.0.6 you can now push all LUA updates to D:\Steam\steamapps\common\MGS_TPP\master\0\00 or 01.dat and the game will register changes.

00.dat contains the fix for Quiets mission bugs and 01.dat is empty. Use 01.dat.

How To:

You take; 

18e0f7804f9e4152|data1\Assets\tpp\script\lib\TppResult.lua key=fc44025d version=2 compressed=0 

from data1.inf, copy it to 01.inf and change data1\ to 01\. 

Note you also have to include the subdir's when repacking, so your folder structure would be; 01\Assets\tpp\script\lib\TppResult.lua 

You do the same thing for any other files. Just open data1.inf and search the file name you need and copy/paste over the line to 01.inf and change the "data1\" to "01\"

After following above steps you can now compile 01.dat and place it in your MGSVTPP\master\0\ folder. 

I recommend reverting to the original untouched data1.dat stored here in the github repo to avoid any complications.

Ex:

01 Folder

![Fig 1](http://puu.sh/kbxW1/92c2cefb24.png)

01.inf

![Fig 2](http://puu.sh/kby4t/64454d427e.png)
