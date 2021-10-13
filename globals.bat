@echo off

rem --------------- common -----------------
set AppName=QuickChangeResolution
set AppVer=1.1
set AppFullName=%AppName% %AppVer%
set AppName_=QuickChangeResolution
set AppExe=QuickChangeResolution.exe
set AppUrl=https://www.pazera-software.com/products/quick-change-resolution/
set CompressionLevel=7


rem ----------------- 32 bit ---------------------
set AppExe32Compiled=QuickChangeRes.32.exe
set PortableFileZip32=%AppName_%_32bit_PORTABLE.zip
set CreatePortableZip32=7z a -tzip -mx=%CompressionLevel% %PortableFileZip32% %AppExe% lang\* README.txt


rem ----------------- 64 bit ---------------------
set AppExe64Compiled=QuickChangeRes.64.exe
set PortableFileZip64=%AppName_%_64bit_PORTABLE.zip
set CreatePortableZip64=7z a -tzip -mx=%CompressionLevel% %PortableFileZip64% %AppExe% lang\* README.txt


