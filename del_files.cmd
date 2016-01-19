@echo off

@echo ===============================================
@echo ====        Borrando de ficheros           ====
@echo ===============================================

@echo == 	deleting folders
rd .\.svn /S /Q
rd .\__history /S /Q
rd .\_external /S /Q
rd .\_pending /S /Q
rd .\_todelete /S /Q
rd .\ChangeVersion /S /Q
rd ".\Demos\Adding objects" /S /Q
rd ".\Demos\Adding Polylines with mouse click" /S /Q
rd .\Demos\ChromiumDemo\Win32 /S /Q
rd .\Demos\GMCircle /S /Q
rd .\Demos\GMElevation /S /Q
rd .\Demos\GMMap /S /Q
rd .\Demos\GMMarker /S /Q
rd .\Demos\MegaDemo\__history /S /Q
rd .\Demos\GMPolygon /S /Q
rd .\Demos\GMPolyline /S /Q
rd .\Demos\GMRectangle /S /Q
rd .\Docs /S /Q
rd .\dpk\__history /S /Q
rd .\dpk\Win32 /S /Q
rd .\dpk\Win64 /S /Q
rd .\Help\kk /S /Q
rd .\Help\old /S /Q
rd .\Help\EN\html /S /Q
rd .\Help\ES\html /S /Q
del .\Help\*.* /Q	
rd .\src\__history /S /Q
rd .\src\VCL\__history /S /Q
rd .\src\FMX\__history /S /Q
rd .\test /S /Q


@echo == 	*.exe files
del *.exe /s /Q	

@echo == 	*.dcu files
del *.dcu /s /Q	

@echo == 	*.hpp files
del *.hpp /s /Q	

@echo == 	*.bpi files
del *.bpi /s /Q	

@echo == 	*.lib files
del *.lib /s /Q	

@echo == 	*.a files
del *.a /s /Q	

@echo == 	*.dcp files
del *.dcp /s /Q	

echo ---------------------------------------------
@echo on
pause
