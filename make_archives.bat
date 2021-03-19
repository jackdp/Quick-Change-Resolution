@echo off

call globals.bat


copy %AppExe32Compiled% %AppExe%
if exist %PortableFileZip32% del %PortableFileZip32%
%CreatePortableZip32%

copy %AppExe64Compiled% %AppExe%
if exist %PortableFileZip64% del %PortableFileZip64%
%CreatePortableZip64%


del %AppExe%
