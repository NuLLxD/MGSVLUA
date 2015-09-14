MGS V QAR Tool v1.3.1
Made by Sergeanur

DESCRIPTION
  This tool was created to unpack and repack data_01.g0s and data_02.g0s
  for PC version of MGS GZ as well as *.dat files for MGS TPP.

USAGE
  MGSV_QAR_Tool.exe file [options]
  To unpack simply drag n' drop g0s or dat onto MGSV_QAR_Tool.exe. The tool
  will create a folder with a filename of *.g0s/*.dat file and extract all
  the content in the folder. Also the inf file will be created containing all
  the stuff required for repacking.
  The inf file contains IDs (hashes), filenames and encryption keys. You
  can change names if you're going to keep your files elsewhere, but
  DO NOT CHANGE ANY ID OR ANY ENCRYPTION KEY!

  To repack simply drag n' drop inf file onto MGSV_QAR_Tool.exe.

  Don't forget to make backups!

OPTIONS
  -r	Decrypt or encrypt all the resources inside QAR (LUA, FPK, JSON, etc.)
	Recommended for unpack. You may not encrypt them while repacking, the
	game will work with decrypted resources anyways.
  -u	Don't use decryption/encrypton on QAR. You NEED this in order to work
	with console versions.
  -eX	Set the encryption method that will be used, where X is number of
	encryption method. (ignored on TPP PC)
	Use -e1 for PC version of MGS GZ. (default)
	Use -e2 for PS3/XBOX360 versions of MGS TPP.


EXTRA
  The program is using dictionary.txt to match hashes with real filenames.
  If you discover any filenames, add them into dictionary.txt and unpack the
  archive - the file that matches with that hash will now have its real name.

  This tool can also use pathid_list_ps3.bin from PS3 version to get filenames
  but only if you don't have correct filenames in dictionary.txt.

EXAMPLES
  In order to extract TPP (X360/PS3 files with decryption you have to run tool
  like this (change 77d720e8d8714bc.dat to desired dat file):

  MGSV_QAR_Tool 77d720e8d8714bc.dat -u -r -e2

  In order to pack it back:

  MGSV_QAR_Tool 77d720e8d8714bc.inf -u -r -e2

  For PC version of MGS GZ (unpack):
  MGSV_QAR_Tool data_01.g0s -r

  For PC version of MGS GZ (pack):
  MGSV_QAR_Tool data_01.inf -r

  For PC version of MGS TPP (unpack):
  MGSV_QAR_Tool data1.dat -r

  For PC version of MGS TPP (pack):
  MGSV_QAR_Tool data1.inf -r


2014-2015