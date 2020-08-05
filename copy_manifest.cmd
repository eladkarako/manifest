@echo off
::                                                        Unicode support for console content and file-names.
chcp 65001 2>nul >nul


::                                                        external resources (path normalised)
set FILE_MANIFEST="%~dp0generic.manifest"
for /f %%a in ("%FILE_MANIFEST%")do ( set "FILE_MANIFEST=%%~fsa"  )


:LOOP
echo.

::has argument ?
if ["%~1"]==[""] (
  echo done.
  goto END;
)

echo "%~1"

::argument exist ?
if not exist %~s1 (
  echo not exist
  goto NEXT;
)
::file exist ?
echo exist
if exist %~s1\NUL (
  echo is a directory
  goto NEXT;
)
::OK
echo is a file
::-------------------------------------------------------------------------------------------
::-------------------------------------------------------------------------------------------


set "FILE_INMAN=%~1.manifest"


::                                              copy the generic manifest,
::                                              - to same folder as the file-name.
::                                              - rename the generic-manifest to same as file-name
::                                                with ".manifest" suffix
call copy /b /y "%FILE_MANIFEST%" "%FILE_INMAN%"  2>nul >nul


::-------------------------------------------------------------------------------------------
::-------------------------------------------------------------------------------------------
:NEXT
shift
goto LOOP

:END
pause

