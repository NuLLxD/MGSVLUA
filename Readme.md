*** Always back up your original files ***

* Initial Commit of LUA Files
* Added list of functions
* Added updated dictionary
* Updated functions
* Added secondary package method
* Added New QAR Tool
* Added New LUA edits

Lua files in repository already contain edits.
Edits included;
* Instant Deployment // 1dae1f9daae6c.lua
* All Unlockables // f4866469f343.lua
* All Soldiers S++ Rank // 2cd691ee890e4.lua
* Instant MB/FOB Development // 2a707b8155b1d.lua
* Easy S Rank Missions // TPPResults.LUA
* Remove rank restriction on items // TPPResults.LUA

Functions and dictionary collected from http://forum.cheatengine.org/viewtopic.php?t=583998

Thanks to user @Lag

Thanks to everyone in the thread who contributed.

Note: To use the Easy S Rank Missions/Removal of rank restrictions on items LUA you must use the dictionary.txt included in the QAR folder and TPPResults.LUA I have in included in the LUA folder.

*** Important ***

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
