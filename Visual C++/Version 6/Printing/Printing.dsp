# Microsoft Developer Studio Project File - Name="Printing" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=Printing - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Printing.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Printing.mak" CFG="Printing - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Printing - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "Printing - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Printing - Win32 Release"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Yu"stdafx.h" /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD BASE RSC /l 0x807 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x807 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:I386
# ADD LINK32 /nologo /subsystem:windows /machine:I386

!ELSEIF  "$(CFG)" == "Printing - Win32 Debug"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Yu"stdafx.h" /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD BASE RSC /l 0x807 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x807 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept

!ENDIF 

# Begin Target

# Name "Printing - Win32 Release"
# Name "Printing - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\adxfunction.cpp
# End Source File
# Begin Source File

SOURCE=.\areaseries.cpp
# End Source File
# Begin Source File

SOURCE=.\arrowseries.cpp
# End Source File
# Begin Source File

SOURCE=.\aspect.cpp
# End Source File
# Begin Source File

SOURCE=.\axes.cpp
# End Source File
# Begin Source File

SOURCE=.\axis.cpp
# End Source File
# Begin Source File

SOURCE=.\axisarrowtool.cpp
# End Source File
# Begin Source File

SOURCE=.\axislabels.cpp
# End Source File
# Begin Source File

SOURCE=.\axistitle.cpp
# End Source File
# Begin Source File

SOURCE=.\bar3dseries.cpp
# End Source File
# Begin Source File

SOURCE=.\barjoinseries.cpp
# End Source File
# Begin Source File

SOURCE=.\barseries.cpp
# End Source File
# Begin Source File

SOURCE=.\bezierseries.cpp
# End Source File
# Begin Source File

SOURCE=.\bmpexport.cpp
# End Source File
# Begin Source File

SOURCE=.\bollingerfunction.cpp
# End Source File
# Begin Source File

SOURCE=.\boxplotseries.cpp
# End Source File
# Begin Source File

SOURCE=.\brush.cpp
# End Source File
# Begin Source File

SOURCE=.\bubbleseries.cpp
# End Source File
# Begin Source File

SOURCE=.\calendarseries.cpp
# End Source File
# Begin Source File

SOURCE=.\candleseries.cpp
# End Source File
# Begin Source File

SOURCE=.\canvas.cpp
# End Source File
# Begin Source File

SOURCE=.\chartfont.cpp
# End Source File
# Begin Source File

SOURCE=.\chartimagetool.cpp
# End Source File
# Begin Source File

SOURCE=.\circlelabels.cpp
# End Source File
# Begin Source File

SOURCE=.\clockseries.cpp
# End Source File
# Begin Source File

SOURCE=.\colorbandtool.cpp
# End Source File
# Begin Source File

SOURCE=.\colorgridseries.cpp
# End Source File
# Begin Source File

SOURCE=.\colorlinetool.cpp
# End Source File
# Begin Source File

SOURCE=.\contourlevel.cpp
# End Source File
# Begin Source File

SOURCE=.\contourlevels.cpp
# End Source File
# Begin Source File

SOURCE=.\contourseries.cpp
# End Source File
# Begin Source File

SOURCE=.\cursortool.cpp
# End Source File
# Begin Source File

SOURCE=.\curvefittingfunction.cpp
# End Source File
# Begin Source File

SOURCE=.\donutseries.cpp
# End Source File
# Begin Source File

SOURCE=.\dragmarkstool.cpp
# End Source File
# Begin Source File

SOURCE=.\drawline.cpp
# End Source File
# Begin Source File

SOURCE=.\drawlinelist.cpp
# End Source File
# Begin Source File

SOURCE=.\drawlinetool.cpp
# End Source File
# Begin Source File

SOURCE=.\environment.cpp
# End Source File
# Begin Source File

SOURCE=.\errorbarseries.cpp
# End Source File
# Begin Source File

SOURCE=.\errorseries.cpp
# End Source File
# Begin Source File

SOURCE=.\expavgfunction.cpp
# End Source File
# Begin Source File

SOURCE=.\explodedslices.cpp
# End Source File
# Begin Source File

SOURCE=.\export.cpp
# End Source File
# Begin Source File

SOURCE=.\fastlineseries.cpp
# End Source File
# Begin Source File

SOURCE=.\funnelseries.cpp
# End Source File
# Begin Source File

SOURCE=.\ganttseries.cpp
# End Source File
# Begin Source File

SOURCE=.\gifexport.cpp
# End Source File
# Begin Source File

SOURCE=.\gradient.cpp
# End Source File
# Begin Source File

SOURCE=.\highlowseries.cpp
# End Source File
# Begin Source File

SOURCE=.\histogramseries.cpp
# End Source File
# Begin Source File

SOURCE=.\horizbarseries.cpp
# End Source File
# Begin Source File

SOURCE=.\horizboxplotseries.cpp
# End Source File
# Begin Source File

SOURCE=.\horizlineseries.cpp
# End Source File
# Begin Source File

SOURCE=.\htmlexport.cpp
# End Source File
# Begin Source File

SOURCE=.\imagebarseries.cpp
# End Source File
# Begin Source File

SOURCE=.\import.cpp
# End Source File
# Begin Source File

SOURCE=.\jpegexport.cpp
# End Source File
# Begin Source File

SOURCE=.\legend.cpp
# End Source File
# Begin Source File

SOURCE=.\legendsymbol.cpp
# End Source File
# Begin Source File

SOURCE=.\macdfunction.cpp
# End Source File
# Begin Source File

SOURCE=.\MainFrm.cpp
# End Source File
# Begin Source File

SOURCE=.\mappolygon.cpp
# End Source File
# Begin Source File

SOURCE=.\mappolygonlist.cpp
# End Source File
# Begin Source File

SOURCE=.\mapseries.cpp
# End Source File
# Begin Source File

SOURCE=.\marks.cpp
# End Source File
# Begin Source File

SOURCE=.\markstiptool.cpp
# End Source File
# Begin Source File

SOURCE=.\metafileexport.cpp
# End Source File
# Begin Source File

SOURCE=.\movingavgfunction.cpp
# End Source File
# Begin Source File

SOURCE=.\nativeexport.cpp
# End Source File
# Begin Source File

SOURCE=.\nearesttool.cpp
# End Source File
# Begin Source File

SOURCE=.\page.cpp
# End Source File
# Begin Source File

SOURCE=.\panel.cpp
# End Source File
# Begin Source File

SOURCE=.\pcxexport.cpp
# End Source File
# Begin Source File

SOURCE=.\pen.cpp
# End Source File
# Begin Source File

SOURCE=.\pieotherslice.cpp
# End Source File
# Begin Source File

SOURCE=.\pieseries.cpp
# End Source File
# Begin Source File

SOURCE=.\pngexport.cpp
# End Source File
# Begin Source File

SOURCE=.\point.cpp
# End Source File
# Begin Source File

SOURCE=.\point3dseries.cpp
# End Source File
# Begin Source File

SOURCE=.\pointer.cpp
# End Source File
# Begin Source File

SOURCE=.\pointseries.cpp
# End Source File
# Begin Source File

SOURCE=.\polarseries.cpp
# End Source File
# Begin Source File

SOURCE=.\printer.cpp
# End Source File
# Begin Source File

SOURCE=.\Printing.cpp
# End Source File
# Begin Source File

SOURCE=.\Printing.rc
# End Source File
# Begin Source File

SOURCE=.\PrintingDoc.cpp
# End Source File
# Begin Source File

SOURCE=.\PrintingView.cpp
# End Source File
# Begin Source File

SOURCE=.\pyramidseries.cpp
# End Source File
# Begin Source File

SOURCE=.\radarseries.cpp
# End Source File
# Begin Source File

SOURCE=.\rmsfunction.cpp
# End Source File
# Begin Source File

SOURCE=.\rotatetool.cpp
# End Source File
# Begin Source File

SOURCE=.\rsifunction.cpp
# End Source File
# Begin Source File

SOURCE=.\scroll.cpp
# End Source File
# Begin Source File

SOURCE=.\series.cpp
# End Source File
# Begin Source File

SOURCE=.\seriesmarkposition.cpp
# End Source File
# Begin Source File

SOURCE=.\seriesmarkspositions.cpp
# End Source File
# Begin Source File

SOURCE=.\shapeseries.cpp
# End Source File
# Begin Source File

SOURCE=.\smithseries.cpp
# End Source File
# Begin Source File

SOURCE=.\StdAfx.cpp
# ADD CPP /Yc"stdafx.h"
# End Source File
# Begin Source File

SOURCE=.\stddeviationfunction.cpp
# End Source File
# Begin Source File

SOURCE=.\strings.cpp
# End Source File
# Begin Source File

SOURCE=.\surfaceseries.cpp
# End Source File
# Begin Source File

SOURCE=.\tchart.cpp
# End Source File
# Begin Source File

SOURCE=.\teefont.cpp
# End Source File
# Begin Source File

SOURCE=.\teefunction.cpp
# End Source File
# Begin Source File

SOURCE=.\teeopengl.cpp
# End Source File
# Begin Source File

SOURCE=.\teepoint2d.cpp
# End Source File
# Begin Source File

SOURCE=.\teepoint3d.cpp
# End Source File
# Begin Source File

SOURCE=.\teeshadow.cpp
# End Source File
# Begin Source File

SOURCE=.\textexport.cpp
# End Source File
# Begin Source File

SOURCE=.\titles.cpp
# End Source File
# Begin Source File

SOURCE=.\toollist.cpp
# End Source File
# Begin Source File

SOURCE=.\tools.cpp
# End Source File
# Begin Source File

SOURCE=.\trisurfaceseries.cpp
# End Source File
# Begin Source File

SOURCE=.\valuelist.cpp
# End Source File
# Begin Source File

SOURCE=.\volumeseries.cpp
# End Source File
# Begin Source File

SOURCE=.\wall.cpp
# End Source File
# Begin Source File

SOURCE=.\walls.cpp
# End Source File
# Begin Source File

SOURCE=.\waterfallseries.cpp
# End Source File
# Begin Source File

SOURCE=.\windroseseries.cpp
# End Source File
# Begin Source File

SOURCE=.\xlsexport.cpp
# End Source File
# Begin Source File

SOURCE=.\xmlexport.cpp
# End Source File
# Begin Source File

SOURCE=.\zoom.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\adxfunction.h
# End Source File
# Begin Source File

SOURCE=.\areaseries.h
# End Source File
# Begin Source File

SOURCE=.\arrowseries.h
# End Source File
# Begin Source File

SOURCE=.\aspect.h
# End Source File
# Begin Source File

SOURCE=.\axes.h
# End Source File
# Begin Source File

SOURCE=.\axis.h
# End Source File
# Begin Source File

SOURCE=.\axisarrowtool.h
# End Source File
# Begin Source File

SOURCE=.\axislabels.h
# End Source File
# Begin Source File

SOURCE=.\axistitle.h
# End Source File
# Begin Source File

SOURCE=.\bar3dseries.h
# End Source File
# Begin Source File

SOURCE=.\barjoinseries.h
# End Source File
# Begin Source File

SOURCE=.\barseries.h
# End Source File
# Begin Source File

SOURCE=.\bezierseries.h
# End Source File
# Begin Source File

SOURCE=.\bmpexport.h
# End Source File
# Begin Source File

SOURCE=.\bollingerfunction.h
# End Source File
# Begin Source File

SOURCE=.\boxplotseries.h
# End Source File
# Begin Source File

SOURCE=.\brush.h
# End Source File
# Begin Source File

SOURCE=.\bubbleseries.h
# End Source File
# Begin Source File

SOURCE=.\calendarseries.h
# End Source File
# Begin Source File

SOURCE=.\candleseries.h
# End Source File
# Begin Source File

SOURCE=.\canvas.h
# End Source File
# Begin Source File

SOURCE=.\chartfont.h
# End Source File
# Begin Source File

SOURCE=.\chartimagetool.h
# End Source File
# Begin Source File

SOURCE=.\circlelabels.h
# End Source File
# Begin Source File

SOURCE=.\clockseries.h
# End Source File
# Begin Source File

SOURCE=.\colorbandtool.h
# End Source File
# Begin Source File

SOURCE=.\colorgridseries.h
# End Source File
# Begin Source File

SOURCE=.\colorlinetool.h
# End Source File
# Begin Source File

SOURCE=.\contourlevel.h
# End Source File
# Begin Source File

SOURCE=.\contourlevels.h
# End Source File
# Begin Source File

SOURCE=.\contourseries.h
# End Source File
# Begin Source File

SOURCE=.\cursortool.h
# End Source File
# Begin Source File

SOURCE=.\curvefittingfunction.h
# End Source File
# Begin Source File

SOURCE=.\depthaxis.h
# End Source File
# Begin Source File

SOURCE=.\donutseries.h
# End Source File
# Begin Source File

SOURCE=.\dragmarkstool.h
# End Source File
# Begin Source File

SOURCE=.\drawline.h
# End Source File
# Begin Source File

SOURCE=.\drawlinelist.h
# End Source File
# Begin Source File

SOURCE=.\drawlinetool.h
# End Source File
# Begin Source File

SOURCE=.\environment.h
# End Source File
# Begin Source File

SOURCE=.\errorbarseries.h
# End Source File
# Begin Source File

SOURCE=.\errorseries.h
# End Source File
# Begin Source File

SOURCE=.\expavgfunction.h
# End Source File
# Begin Source File

SOURCE=.\explodedslices.h
# End Source File
# Begin Source File

SOURCE=.\export.h
# End Source File
# Begin Source File

SOURCE=.\fastlineseries.h
# End Source File
# Begin Source File

SOURCE=.\funnelseries.h
# End Source File
# Begin Source File

SOURCE=.\ganttseries.h
# End Source File
# Begin Source File

SOURCE=.\gifexport.h
# End Source File
# Begin Source File

SOURCE=.\gradient.h
# End Source File
# Begin Source File

SOURCE=.\highlowseries.h
# End Source File
# Begin Source File

SOURCE=.\histogramseries.h
# End Source File
# Begin Source File

SOURCE=.\horizbarseries.h
# End Source File
# Begin Source File

SOURCE=.\horizboxplotseries.h
# End Source File
# Begin Source File

SOURCE=.\horizlineseries.h
# End Source File
# Begin Source File

SOURCE=.\htmlexport.h
# End Source File
# Begin Source File

SOURCE=.\imagebarseries.h
# End Source File
# Begin Source File

SOURCE=.\import.h
# End Source File
# Begin Source File

SOURCE=.\jpegexport.h
# End Source File
# Begin Source File

SOURCE=.\legend.h
# End Source File
# Begin Source File

SOURCE=.\legendsymbol.h
# End Source File
# Begin Source File

SOURCE=.\macdfunction.h
# End Source File
# Begin Source File

SOURCE=.\MainFrm.h
# End Source File
# Begin Source File

SOURCE=.\mappolygon.h
# End Source File
# Begin Source File

SOURCE=.\mappolygonlist.h
# End Source File
# Begin Source File

SOURCE=.\mapseries.h
# End Source File
# Begin Source File

SOURCE=.\marks.h
# End Source File
# Begin Source File

SOURCE=.\markstiptool.h
# End Source File
# Begin Source File

SOURCE=.\metafileexport.h
# End Source File
# Begin Source File

SOURCE=.\movingavgfunction.h
# End Source File
# Begin Source File

SOURCE=.\nativeexport.h
# End Source File
# Begin Source File

SOURCE=.\nearesttool.h
# End Source File
# Begin Source File

SOURCE=.\page.h
# End Source File
# Begin Source File

SOURCE=.\panel.h
# End Source File
# Begin Source File

SOURCE=.\pcxexport.h
# End Source File
# Begin Source File

SOURCE=.\pen.h
# End Source File
# Begin Source File

SOURCE=.\pieotherslice.h
# End Source File
# Begin Source File

SOURCE=.\pieseries.h
# End Source File
# Begin Source File

SOURCE=.\pngexport.h
# End Source File
# Begin Source File

SOURCE=.\point.h
# End Source File
# Begin Source File

SOURCE=.\point3dseries.h
# End Source File
# Begin Source File

SOURCE=.\pointer.h
# End Source File
# Begin Source File

SOURCE=.\pointseries.h
# End Source File
# Begin Source File

SOURCE=.\polarseries.h
# End Source File
# Begin Source File

SOURCE=.\printer.h
# End Source File
# Begin Source File

SOURCE=.\Printing.h
# End Source File
# Begin Source File

SOURCE=.\PrintingDoc.h
# End Source File
# Begin Source File

SOURCE=.\PrintingView.h
# End Source File
# Begin Source File

SOURCE=.\pyramidseries.h
# End Source File
# Begin Source File

SOURCE=.\radarseries.h
# End Source File
# Begin Source File

SOURCE=.\Resource.h
# End Source File
# Begin Source File

SOURCE=.\rmsfunction.h
# End Source File
# Begin Source File

SOURCE=.\rotatetool.h
# End Source File
# Begin Source File

SOURCE=.\rsifunction.h
# End Source File
# Begin Source File

SOURCE=.\scroll.h
# End Source File
# Begin Source File

SOURCE=.\series.h
# End Source File
# Begin Source File

SOURCE=.\seriesmarkposition.h
# End Source File
# Begin Source File

SOURCE=.\seriesmarkspositions.h
# End Source File
# Begin Source File

SOURCE=.\shapeseries.h
# End Source File
# Begin Source File

SOURCE=.\smithseries.h
# End Source File
# Begin Source File

SOURCE=.\StdAfx.h
# End Source File
# Begin Source File

SOURCE=.\stddeviationfunction.h
# End Source File
# Begin Source File

SOURCE=.\strings.h
# End Source File
# Begin Source File

SOURCE=.\surfaceseries.h
# End Source File
# Begin Source File

SOURCE=.\tchart.h
# End Source File
# Begin Source File

SOURCE=.\teefont.h
# End Source File
# Begin Source File

SOURCE=.\teefunction.h
# End Source File
# Begin Source File

SOURCE=.\teeopengl.h
# End Source File
# Begin Source File

SOURCE=.\teepoint2d.h
# End Source File
# Begin Source File

SOURCE=.\teepoint3d.h
# End Source File
# Begin Source File

SOURCE=.\teeshadow.h
# End Source File
# Begin Source File

SOURCE=.\textexport.h
# End Source File
# Begin Source File

SOURCE=.\titles.h
# End Source File
# Begin Source File

SOURCE=.\toollist.h
# End Source File
# Begin Source File

SOURCE=.\tools.h
# End Source File
# Begin Source File

SOURCE=.\trisurfaceseries.h
# End Source File
# Begin Source File

SOURCE=.\valuelist.h
# End Source File
# Begin Source File

SOURCE=.\volumeseries.h
# End Source File
# Begin Source File

SOURCE=.\wall.h
# End Source File
# Begin Source File

SOURCE=.\walls.h
# End Source File
# Begin Source File

SOURCE=.\waterfallseries.h
# End Source File
# Begin Source File

SOURCE=.\windroseseries.h
# End Source File
# Begin Source File

SOURCE=.\xlsexport.h
# End Source File
# Begin Source File

SOURCE=.\xmlexport.h
# End Source File
# Begin Source File

SOURCE=.\zoom.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\res\Printing.ico
# End Source File
# Begin Source File

SOURCE=.\res\Printing.rc2
# End Source File
# Begin Source File

SOURCE=.\res\PrintingDoc.ico
# End Source File
# Begin Source File

SOURCE=.\res\Toolbar.bmp
# End Source File
# End Group
# Begin Source File

SOURCE=.\ReadMe.txt
# End Source File
# End Target
# End Project
# Section Printing : {19BF1483-5269-4A6D-B258-43F2DDC36434}
# 	2:5:Class:CRSIFunction
# 	2:10:HeaderFile:rsifunction.h
# 	2:8:ImplFile:rsifunction.cpp
# End Section
# Section Printing : {C428F20A-B68A-468A-A969-01D39387449D}
# 	2:5:Class:CSmithSeries
# 	2:10:HeaderFile:smithseries.h
# 	2:8:ImplFile:smithseries.cpp
# End Section
# Section Printing : {7F915526-2C4C-42F9-8372-9378A0CE96BC}
# 	2:5:Class:CAxisArrowTool
# 	2:10:HeaderFile:axisarrowtool.h
# 	2:8:ImplFile:axisarrowtool.cpp
# End Section
# Section Printing : {5DC9918D-3100-4D89-AC17-9DA053645997}
# 	2:5:Class:CBar3DSeries
# 	2:10:HeaderFile:bar3dseries.h
# 	2:8:ImplFile:bar3dseries.cpp
# End Section
# Section Printing : {6F048CAC-362A-4C85-883C-38AD823E9FE1}
# 	2:5:Class:CPanel
# 	2:10:HeaderFile:panel.h
# 	2:8:ImplFile:panel.cpp
# End Section
# Section Printing : {5CD125DF-DE0E-43A9-8AEE-08A521F98678}
# 	2:5:Class:CZoom
# 	2:10:HeaderFile:zoom.h
# 	2:8:ImplFile:zoom.cpp
# End Section
# Section Printing : {83EF5759-ACF4-42A0-A04B-24B5F9F2A68F}
# 	2:5:Class:CCircleLabels
# 	2:10:HeaderFile:circlelabels.h
# 	2:8:ImplFile:circlelabels.cpp
# End Section
# Section Printing : {939EEC51-3983-46E0-A5BE-0D917CD64196}
# 	2:5:Class:CPieSeries
# 	2:10:HeaderFile:pieseries.h
# 	2:8:ImplFile:pieseries.cpp
# End Section
# Section Printing : {401C4CF5-21C9-46F1-9AE4-A9AEFEAB8EE0}
# 	2:5:Class:CBoxPlotSeries
# 	2:10:HeaderFile:boxplotseries.h
# 	2:8:ImplFile:boxplotseries.cpp
# End Section
# Section Printing : {C24D3866-BF5C-4D7B-B4A8-7BA41FA76050}
# 	2:5:Class:CChartImageTool
# 	2:10:HeaderFile:chartimagetool.h
# 	2:8:ImplFile:chartimagetool.cpp
# End Section
# Section Printing : {D20C7F86-E2EE-422F-B61F-648379857031}
# 	2:5:Class:CBarSeries
# 	2:10:HeaderFile:barseries.h
# 	2:8:ImplFile:barseries.cpp
# End Section
# Section Printing : {0999697D-39E0-4D18-A9E6-93DE6E360087}
# 	2:5:Class:CTeeFont
# 	2:10:HeaderFile:teefont.h
# 	2:8:ImplFile:teefont.cpp
# End Section
# Section Printing : {54496C71-6C28-4BE9-8CCF-96823C0000B4}
# 	2:5:Class:CHighLowSeries
# 	2:10:HeaderFile:highlowseries.h
# 	2:8:ImplFile:highlowseries.cpp
# End Section
# Section Printing : {9768D8BE-CEDC-409E-A8BE-D03E41822F42}
# 	2:5:Class:CCanvas
# 	2:10:HeaderFile:canvas.h
# 	2:8:ImplFile:canvas.cpp
# End Section
# Section Printing : {174C3474-3B0B-4309-97CA-FF3AF16F54F8}
# 	2:5:Class:CChartFont
# 	2:10:HeaderFile:chartfont.h
# 	2:8:ImplFile:chartfont.cpp
# End Section
# Section Printing : {DC32ACE6-2974-4AB5-BB10-034B80C75FE3}
# 	2:5:Class:CHorizBarSeries
# 	2:10:HeaderFile:horizbarseries.h
# 	2:8:ImplFile:horizbarseries.cpp
# End Section
# Section Printing : {9442BB81-2559-42F9-90B9-7107DFF82C26}
# 	2:5:Class:CDragMarksTool
# 	2:10:HeaderFile:dragmarkstool.h
# 	2:8:ImplFile:dragmarkstool.cpp
# End Section
# Section Printing : {ECEF32C8-943A-461E-9F3F-5E6F3F313530}
# 	2:5:Class:CAxisLabels
# 	2:10:HeaderFile:axislabels.h
# 	2:8:ImplFile:axislabels.cpp
# End Section
# Section Printing : {537F555E-9591-458B-A030-5C8D157F3C77}
# 	2:5:Class:CTextExport
# 	2:10:HeaderFile:textexport.h
# 	2:8:ImplFile:textexport.cpp
# End Section
# Section Printing : {F7E7D1E5-1577-42E9-B803-F9F1E2A58661}
# 	2:5:Class:CSeriesMarksPositions
# 	2:10:HeaderFile:seriesmarkspositions.h
# 	2:8:ImplFile:seriesmarkspositions.cpp
# End Section
# Section Printing : {BF41B7DB-490A-43BF-8B28-3E8506CC80C3}
# 	2:5:Class:CDrawLine
# 	2:10:HeaderFile:drawline.h
# 	2:8:ImplFile:drawline.cpp
# End Section
# Section Printing : {E301B7EA-E881-437B-9575-264224D6F770}
# 	2:5:Class:CColorLineTool
# 	2:10:HeaderFile:colorlinetool.h
# 	2:8:ImplFile:colorlinetool.cpp
# End Section
# Section Printing : {52A8160B-1139-4B9F-8FAD-51CBA1402C62}
# 	2:5:Class:CLegend
# 	2:10:HeaderFile:legend.h
# 	2:8:ImplFile:legend.cpp
# End Section
# Section Printing : {62C0FF07-3210-47C6-BC37-B857F568ADD6}
# 	2:5:Class:CClockSeries
# 	2:10:HeaderFile:clockseries.h
# 	2:8:ImplFile:clockseries.cpp
# End Section
# Section Printing : {F07C6CCF-814E-4D54-A4A8-3D83B2AE61D4}
# 	2:5:Class:CADXFunction
# 	2:10:HeaderFile:adxfunction.h
# 	2:8:ImplFile:adxfunction.cpp
# End Section
# Section Printing : {2A1E548E-0C7C-4602-846E-8C7600EF8BD6}
# 	2:5:Class:CMACDFunction
# 	2:10:HeaderFile:macdfunction.h
# 	2:8:ImplFile:macdfunction.cpp
# End Section
# Section Printing : {D4B518BD-5A95-44F5-9713-24E0CA5BD6A8}
# 	2:5:Class:CHistogramSeries
# 	2:10:HeaderFile:histogramseries.h
# 	2:8:ImplFile:histogramseries.cpp
# End Section
# Section Printing : {707A3B28-3615-4B53-8190-74336CA5DD55}
# 	2:5:Class:CTeePoint3D
# 	2:10:HeaderFile:teepoint3d.h
# 	2:8:ImplFile:teepoint3d.cpp
# End Section
# Section Printing : {28444093-7AEE-40D5-9A22-EDE8655A3D86}
# 	2:5:Class:CErrorBarSeries
# 	2:10:HeaderFile:errorbarseries.h
# 	2:8:ImplFile:errorbarseries.cpp
# End Section
# Section Printing : {0302E2A9-B90A-4ED3-A5BC-F49BCD6A3AEC}
# 	2:5:Class:CScroll
# 	2:10:HeaderFile:scroll.h
# 	2:8:ImplFile:scroll.cpp
# End Section
# Section Printing : {DE3CB118-66CA-49E4-AA2C-7819268EF875}
# 	2:5:Class:CPolarSeries
# 	2:10:HeaderFile:polarseries.h
# 	2:8:ImplFile:polarseries.cpp
# End Section
# Section Printing : {35EAECC5-04E9-4D8D-A831-E133475DF051}
# 	2:5:Class:CToolList
# 	2:10:HeaderFile:toollist.h
# 	2:8:ImplFile:toollist.cpp
# End Section
# Section Printing : {157F31F6-F4FD-4681-9FD6-B6E96FA84CFB}
# 	2:5:Class:CShapeSeries
# 	2:10:HeaderFile:shapeseries.h
# 	2:8:ImplFile:shapeseries.cpp
# End Section
# Section Printing : {C6A3856A-AE44-49CC-967A-03E8230B9FAA}
# 	2:5:Class:CCursorTool
# 	2:10:HeaderFile:cursortool.h
# 	2:8:ImplFile:cursortool.cpp
# End Section
# Section Printing : {01A1A818-3011-4237-ADBC-7A36F0A28BCD}
# 	2:5:Class:CAreaSeries
# 	2:10:HeaderFile:areaseries.h
# 	2:8:ImplFile:areaseries.cpp
# End Section
# Section Printing : {1951A5D7-5CB0-4C85-9DE2-4BB3FEA47257}
# 	2:5:Class:CBezierSeries
# 	2:10:HeaderFile:bezierseries.h
# 	2:8:ImplFile:bezierseries.cpp
# End Section
# Section Printing : {99BB4DE8-DF5F-43EB-B8D2-6EA5B5272112}
# 	2:5:Class:CValueList
# 	2:10:HeaderFile:valuelist.h
# 	2:8:ImplFile:valuelist.cpp
# End Section
# Section Printing : {022F4EE7-65CF-4934-87C0-595986AAE6AD}
# 	2:5:Class:CCurveFittingFunction
# 	2:10:HeaderFile:curvefittingfunction.h
# 	2:8:ImplFile:curvefittingfunction.cpp
# End Section
# Section Printing : {7F830F00-AF05-4EC9-9901-B94A88A4FF73}
# 	2:5:Class:CImport
# 	2:10:HeaderFile:import.h
# 	2:8:ImplFile:import.cpp
# End Section
# Section Printing : {A7CBFABD-3FFA-4996-B04D-1559ECAD2CE4}
# 	2:5:Class:CPNGExport
# 	2:10:HeaderFile:pngexport.h
# 	2:8:ImplFile:pngexport.cpp
# End Section
# Section Printing : {F6F2A15A-6EF1-45DE-B360-59D90ECBC2CC}
# 	2:5:Class:CPyramidSeries
# 	2:10:HeaderFile:pyramidseries.h
# 	2:8:ImplFile:pyramidseries.cpp
# End Section
# Section Printing : {D6341CF8-1AD7-47C2-9164-D9B137A82CD0}
# 	2:5:Class:CPage
# 	2:10:HeaderFile:page.h
# 	2:8:ImplFile:page.cpp
# End Section
# Section Printing : {A54FD2D4-397C-4A91-8EEA-5A3DE72C66DF}
# 	2:5:Class:CImageBarSeries
# 	2:10:HeaderFile:imagebarseries.h
# 	2:8:ImplFile:imagebarseries.cpp
# End Section
# Section Printing : {8D9CAC5B-4D8D-485E-9E04-56CE9606AD2A}
# 	2:5:Class:CJPEGExport
# 	2:10:HeaderFile:jpegexport.h
# 	2:8:ImplFile:jpegexport.cpp
# End Section
# Section Printing : {512C6FEB-66A2-4E68-BA81-91C488ADA5EB}
# 	2:5:Class:CWaterfallSeries
# 	2:10:HeaderFile:waterfallseries.h
# 	2:8:ImplFile:waterfallseries.cpp
# End Section
# Section Printing : {47C543A0-66EE-4005-82C9-2ECB03C5AD0A}
# 	2:5:Class:CSurfaceSeries
# 	2:10:HeaderFile:surfaceseries.h
# 	2:8:ImplFile:surfaceseries.cpp
# End Section
# Section Printing : {5BB511D7-2F1C-49F2-8D2F-0460EC8B1EE4}
# 	2:5:Class:CRMSFunction
# 	2:10:HeaderFile:rmsfunction.h
# 	2:8:ImplFile:rmsfunction.cpp
# End Section
# Section Printing : {A36582A5-2408-42A2-BF9D-BEE68A3AD50F}
# 	2:5:Class:CColorBandTool
# 	2:10:HeaderFile:colorbandtool.h
# 	2:8:ImplFile:colorbandtool.cpp
# End Section
# Section Printing : {9E69D8F5-A877-401C-AC1E-12E41ABA9988}
# 	2:5:Class:CPCXExport
# 	2:10:HeaderFile:pcxexport.h
# 	2:8:ImplFile:pcxexport.cpp
# End Section
# Section Printing : {3B2B9818-FBBF-11D4-93CA-006008A7EED4}
# 	2:5:Class:CChartBrush
# 	2:10:HeaderFile:chartbrush.h
# 	2:8:ImplFile:chartbrush.cpp
# End Section
# Section Printing : {6F5CD60C-B020-4D75-B464-D04A56618E3D}
# 	2:5:Class:CMovingAvgFunction
# 	2:10:HeaderFile:movingavgfunction.h
# 	2:8:ImplFile:movingavgfunction.cpp
# End Section
# Section Printing : {0971EF55-9D19-4DEC-A11A-B7ACCA1B426D}
# 	2:5:Class:CStrings
# 	2:10:HeaderFile:strings.h
# 	2:8:ImplFile:strings.cpp
# End Section
# Section Printing : {8E32123C-B86F-4AB6-ADCB-AC1F6B0585E8}
# 	2:5:Class:CGanttSeries
# 	2:10:HeaderFile:ganttseries.h
# 	2:8:ImplFile:ganttseries.cpp
# End Section
# Section Printing : {D66F24D8-E889-4558-AA70-412B5EBC6C2B}
# 	2:5:Class:CMarks
# 	2:10:HeaderFile:marks.h
# 	2:8:ImplFile:marks.cpp
# End Section
# Section Printing : {264FD8CE-204D-4951-B2CA-85B1F93399DB}
# 	2:5:Class:CDrawLineTool
# 	2:10:HeaderFile:drawlinetool.h
# 	2:8:ImplFile:drawlinetool.cpp
# End Section
# Section Printing : {FA1275A7-13D3-48B7-8B25-C3DFCC194DAF}
# 	2:5:Class:CNativeExport
# 	2:10:HeaderFile:nativeexport.h
# 	2:8:ImplFile:nativeexport.cpp
# End Section
# Section Printing : {8F9061B2-8F72-40AF-9984-2074375C32F3}
# 	2:5:Class:CTeeOpenGL
# 	2:10:HeaderFile:teeopengl.h
# 	2:8:ImplFile:teeopengl.cpp
# End Section
# Section Printing : {4AD8CB5F-2FE2-4B16-B015-25E736B4AE58}
# 	2:5:Class:CWalls
# 	2:10:HeaderFile:walls.h
# 	2:8:ImplFile:walls.cpp
# End Section
# Section Printing : {7FB32052-8E1A-46F2-857C-CA57A8C7257F}
# 	2:5:Class:CBMPExport
# 	2:10:HeaderFile:bmpexport.h
# 	2:8:ImplFile:bmpexport.cpp
# End Section
# Section Printing : {DAB6D5FD-88FC-4FA7-87FF-CB828B05873F}
# 	2:5:Class:CColorGridSeries
# 	2:10:HeaderFile:colorgridseries.h
# 	2:8:ImplFile:colorgridseries.cpp
# End Section
# Section Printing : {5447B384-8D36-4A99-A790-0C7E2CC9CF65}
# 	2:5:Class:CFastLineSeries
# 	2:10:HeaderFile:fastlineseries.h
# 	2:8:ImplFile:fastlineseries.cpp
# End Section
# Section Printing : {06707B07-419F-40DD-B2A8-B2D3D36B8128}
# 	2:5:Class:CXMLExport
# 	2:10:HeaderFile:xmlexport.h
# 	2:8:ImplFile:xmlexport.cpp
# End Section
# Section Printing : {D7CC6D0F-4C49-42E4-B2FF-70465655F195}
# 	2:5:Class:CHorizBoxPlotSeries
# 	2:10:HeaderFile:horizboxplotseries.h
# 	2:8:ImplFile:horizboxplotseries.cpp
# End Section
# Section Printing : {FA22BB67-26E0-4617-83B7-75ABFBB61A37}
# 	2:5:Class:CSeriesMarkPosition
# 	2:10:HeaderFile:seriesmarkposition.h
# 	2:8:ImplFile:seriesmarkposition.cpp
# End Section
# Section Printing : {D7A96B84-5FCE-4104-996A-7739F6A3F2A6}
# 	2:5:Class:CTeePoint2D
# 	2:10:HeaderFile:teepoint2d.h
# 	2:8:ImplFile:teepoint2d.cpp
# End Section
# Section Printing : {3BDF2882-CA3B-4CAE-8441-CFF6F7479F73}
# 	2:5:Class:CBrush1
# 	2:10:HeaderFile:brush.h
# 	2:8:ImplFile:brush.cpp
# End Section
# Section Printing : {217F579F-D13A-4D43-9463-962602B6FD23}
# 	2:5:Class:CWindRoseSeries
# 	2:10:HeaderFile:windroseseries.h
# 	2:8:ImplFile:windroseseries.cpp
# End Section
# Section Printing : {B4E602E1-98C9-4356-96CD-28837AE8230A}
# 	2:5:Class:CMarksTipTool
# 	2:10:HeaderFile:markstiptool.h
# 	2:8:ImplFile:markstiptool.cpp
# End Section
# Section Printing : {64D65067-CC63-43B6-AED1-40B66FDB5A8D}
# 	2:5:Class:CExport
# 	2:10:HeaderFile:export.h
# 	2:8:ImplFile:export.cpp
# End Section
# Section Printing : {0DA62362-495F-4C09-9892-760E7CE36197}
# 	2:5:Class:CTitles
# 	2:10:HeaderFile:titles.h
# 	2:8:ImplFile:titles.cpp
# End Section
# Section Printing : {DCB89B5D-B389-4026-8E2C-4D4FBD026081}
# 	2:5:Class:CHTMLExport
# 	2:10:HeaderFile:htmlexport.h
# 	2:8:ImplFile:htmlexport.cpp
# End Section
# Section Printing : {638C371A-C994-4FE6-A7EE-05F0132FF303}
# 	2:5:Class:CWall
# 	2:10:HeaderFile:wall.h
# 	2:8:ImplFile:wall.cpp
# End Section
# Section Printing : {4E839805-0AA0-45D7-94FB-E133D1AB53E0}
# 	2:5:Class:CBollingerFunction
# 	2:10:HeaderFile:bollingerfunction.h
# 	2:8:ImplFile:bollingerfunction.cpp
# End Section
# Section Printing : {D95C8DB0-C757-483F-B387-53D147200D06}
# 	2:5:Class:CPoint3DSeries
# 	2:10:HeaderFile:point3dseries.h
# 	2:8:ImplFile:point3dseries.cpp
# End Section
# Section Printing : {9814A73B-6CB9-49F5-8BCE-63DBBDC1FEEE}
# 	2:5:Class:CAxes
# 	2:10:HeaderFile:axes.h
# 	2:8:ImplFile:axes.cpp
# End Section
# Section Printing : {2BF45703-CDBE-444B-9281-D6D91E5282DA}
# 	2:5:Class:CEnvironment
# 	2:10:HeaderFile:environment.h
# 	2:8:ImplFile:environment.cpp
# End Section
# Section Printing : {0AA37AF4-2BC3-47A0-A02A-7EC16A2CFC4C}
# 	2:5:Class:CPointer
# 	2:10:HeaderFile:pointer.h
# 	2:8:ImplFile:pointer.cpp
# End Section
# Section Printing : {5544067F-5AFD-4068-AD21-0AD3071D32C4}
# 	2:5:Class:CDrawLineList
# 	2:10:HeaderFile:drawlinelist.h
# 	2:8:ImplFile:drawlinelist.cpp
# End Section
# Section Printing : {4E885C7C-993B-47B8-B1CE-27FEE0D8D738}
# 	2:5:Class:CStdDeviationFunction
# 	2:10:HeaderFile:stddeviationfunction.h
# 	2:8:ImplFile:stddeviationfunction.cpp
# End Section
# Section Printing : {A0EAE063-A7D5-48E0-B8FF-D29B914B1B80}
# 	2:5:Class:CFunnelSeries
# 	2:10:HeaderFile:funnelseries.h
# 	2:8:ImplFile:funnelseries.cpp
# End Section
# Section Printing : {62AD82D0-8B5B-4A52-9453-DA71B2D35AEB}
# 	2:5:Class:CTeeFunction
# 	2:10:HeaderFile:teefunction.h
# 	2:8:ImplFile:teefunction.cpp
# End Section
# Section Printing : {3139408B-67FA-4E6A-9347-DEB78BBFBB38}
# 	2:5:Class:CAxis
# 	2:10:HeaderFile:axis.h
# 	2:8:ImplFile:axis.cpp
# End Section
# Section Printing : {9EA70AD9-CA8A-488E-B9D6-801C1FEE084E}
# 	2:5:Class:CCalendarSeries
# 	2:10:HeaderFile:calendarseries.h
# 	2:8:ImplFile:calendarseries.cpp
# End Section
# Section Printing : {3F3E1E1C-81B6-4B11-84A5-25812A9491F6}
# 	2:5:Class:CTChart
# 	2:10:HeaderFile:tchart.h
# 	2:8:ImplFile:tchart.cpp
# End Section
# Section Printing : {BDE9AA5B-83AD-4A4B-B70B-DA18EDD80647}
# 	2:5:Class:CHorizLineSeries
# 	2:10:HeaderFile:horizlineseries.h
# 	2:8:ImplFile:horizlineseries.cpp
# End Section
# Section Printing : {1A5F54DE-AC32-4F25-A31A-BBE6EA7A0751}
# 	2:5:Class:CDonutSeries
# 	2:10:HeaderFile:donutseries.h
# 	2:8:ImplFile:donutseries.cpp
# End Section
# Section Printing : {3F7AC104-8BE8-40F7-81C5-8C803EB58AF5}
# 	2:5:Class:CPieOtherSlice
# 	2:10:HeaderFile:pieotherslice.h
# 	2:8:ImplFile:pieotherslice.cpp
# End Section
# Section Printing : {D6DB7A13-EF3C-4C9A-976B-8CBAF15DB6F8}
# 	2:5:Class:CCustomSeries
# 	2:10:HeaderFile:customseries.h
# 	2:8:ImplFile:customseries.cpp
# End Section
# Section Printing : {741E06F7-DA55-4E7A-9E07-EE991D6DA23C}
# 	2:5:Class:CRotateTool
# 	2:10:HeaderFile:rotatetool.h
# 	2:8:ImplFile:rotatetool.cpp
# End Section
# Section Printing : {F120C3A7-D72B-44DA-A0F2-8FAFA40B1514}
# 	2:5:Class:CAspect
# 	2:10:HeaderFile:aspect.h
# 	2:8:ImplFile:aspect.cpp
# End Section
# Section Printing : {E6FF9EEA-7DE5-4CA8-9174-D2C3AC3B2018}
# 	2:5:Class:CMapSeries
# 	2:10:HeaderFile:mapseries.h
# 	2:8:ImplFile:mapseries.cpp
# End Section
# Section Printing : {7F481299-B02C-42D5-9884-5BCA8202CC75}
# 	2:5:Class:CMapPolygonList
# 	2:10:HeaderFile:mappolygonlist.h
# 	2:8:ImplFile:mappolygonlist.cpp
# End Section
# Section Printing : {AAFCB366-607B-48A9-AB0E-DA244885456A}
# 	2:5:Class:CContourLevels
# 	2:10:HeaderFile:contourlevels.h
# 	2:8:ImplFile:contourlevels.cpp
# End Section
# Section Printing : {05A246C5-510A-4E9A-BBA0-A79FF89CF662}
# 	2:5:Class:CBarJoinSeries
# 	2:10:HeaderFile:barjoinseries.h
# 	2:8:ImplFile:barjoinseries.cpp
# End Section
# Section Printing : {2FAEDD3D-43EC-11D2-AEBE-00400141862D}
# 	2:5:Class:CDepthAxis
# 	2:10:HeaderFile:depthaxis.h
# 	2:8:ImplFile:depthaxis.cpp
# End Section
# Section Printing : {5823C1A8-C036-40DA-B726-51FFDD4AB5A7}
# 	2:5:Class:CMapPolygon
# 	2:10:HeaderFile:mappolygon.h
# 	2:8:ImplFile:mappolygon.cpp
# End Section
# Section Printing : {42DAE878-5F23-4CE9-ABEE-63D26C3058B5}
# 	2:5:Class:CBubbleSeries
# 	2:10:HeaderFile:bubbleseries.h
# 	2:8:ImplFile:bubbleseries.cpp
# End Section
# Section Printing : {5066599D-2BD4-4622-8AE2-2FDB99D04369}
# 	2:5:Class:CLegendSymbol
# 	2:10:HeaderFile:legendsymbol.h
# 	2:8:ImplFile:legendsymbol.cpp
# End Section
# Section Printing : {3BBA7FFD-E87F-4259-BD58-B68DD7A64D67}
# 	2:5:Class:CContourLevel
# 	2:10:HeaderFile:contourlevel.h
# 	2:8:ImplFile:contourlevel.cpp
# End Section
# Section Printing : {554B3035-47C5-11D2-AEC7-00400141862D}
# 	2:5:Class:CPoint1
# 	2:10:HeaderFile:point.h
# 	2:8:ImplFile:point.cpp
# End Section
# Section Printing : {19796A17-AC2E-4F6A-90CE-4634B18E1960}
# 	2:5:Class:CErrorSeries
# 	2:10:HeaderFile:errorseries.h
# 	2:8:ImplFile:errorseries.cpp
# End Section
# Section Printing : {73C6999E-FF7F-4276-93CD-C4A09C6584E6}
# 	2:5:Class:CPrinter
# 	2:10:HeaderFile:printer.h
# 	2:8:ImplFile:printer.cpp
# End Section
# Section Printing : {2223B2CD-2570-4AB4-A6F5-A14385204749}
# 	2:5:Class:CMetafileExport
# 	2:10:HeaderFile:metafileexport.h
# 	2:8:ImplFile:metafileexport.cpp
# End Section
# Section Printing : {CE6F7A30-953E-4D3C-99B9-9D97A4F07E01}
# 	2:5:Class:CTriSurfaceSeries
# 	2:10:HeaderFile:trisurfaceseries.h
# 	2:8:ImplFile:trisurfaceseries.cpp
# End Section
# Section Printing : {2383D6A7-DA68-4601-A47C-B29726E93DEA}
# 	2:5:Class:CNearestTool
# 	2:10:HeaderFile:nearesttool.h
# 	2:8:ImplFile:nearesttool.cpp
# End Section
# Section Printing : {B1123A7B-2F66-4BED-A22B-766C628EB18B}
# 	2:5:Class:CPointSeries
# 	2:10:HeaderFile:pointseries.h
# 	2:8:ImplFile:pointseries.cpp
# End Section
# Section Printing : {D6AE5BB6-0094-445F-A784-A3EF266E99E7}
# 	2:5:Class:CCandleSeries
# 	2:10:HeaderFile:candleseries.h
# 	2:8:ImplFile:candleseries.cpp
# End Section
# Section Printing : {516F3B6E-71AC-4160-8A5A-182734FC2D7C}
# 	2:5:Class:CExplodedSlices
# 	2:10:HeaderFile:explodedslices.h
# 	2:8:ImplFile:explodedslices.cpp
# End Section
# Section Printing : {F987DBFF-BF04-47BC-84C1-ADAC64C022DE}
# 	2:5:Class:CSeries
# 	2:10:HeaderFile:series.h
# 	2:8:ImplFile:series.cpp
# End Section
# Section Printing : {240F64DD-5140-4123-9C09-695D0FA837A8}
# 	2:5:Class:CGIFExport
# 	2:10:HeaderFile:gifexport.h
# 	2:8:ImplFile:gifexport.cpp
# End Section
# Section Printing : {CC0427C7-2124-4770-8847-F9EF4C50CDC2}
# 	2:21:DefaultSinkHeaderFile:tchart.h
# 	2:16:DefaultSinkClass:CTChart
# End Section
# Section Printing : {F2A35F84-A32B-447E-B11A-76EA1EA9BCC7}
# 	2:5:Class:CPen1
# 	2:10:HeaderFile:pen.h
# 	2:8:ImplFile:pen.cpp
# End Section
# Section Printing : {AFBF5D7A-3265-4E2E-8126-FC1243AEF0F8}
# 	2:5:Class:CTeeShadow
# 	2:10:HeaderFile:teeshadow.h
# 	2:8:ImplFile:teeshadow.cpp
# End Section
# Section Printing : {455BED9B-4374-4313-B56C-F0FD48B53013}
# 	2:5:Class:CContourSeries
# 	2:10:HeaderFile:contourseries.h
# 	2:8:ImplFile:contourseries.cpp
# End Section
# Section Printing : {567A8B98-496C-4698-86F4-9DE89E73E304}
# 	2:5:Class:CAxisTitle
# 	2:10:HeaderFile:axistitle.h
# 	2:8:ImplFile:axistitle.cpp
# End Section
# Section Printing : {CFDE54FB-AAC5-4E46-B7F5-435F712C04AD}
# 	2:5:Class:CVolumeSeries
# 	2:10:HeaderFile:volumeseries.h
# 	2:8:ImplFile:volumeseries.cpp
# End Section
# Section Printing : {6468EDD8-B3AC-4E63-9E7C-0E183944A1F9}
# 	2:5:Class:CXLSExport
# 	2:10:HeaderFile:xlsexport.h
# 	2:8:ImplFile:xlsexport.cpp
# End Section
# Section Printing : {8DC0DD6C-9F60-439A-B4C9-128852AC9EE7}
# 	2:5:Class:CTools
# 	2:10:HeaderFile:tools.h
# 	2:8:ImplFile:tools.cpp
# End Section
# Section Printing : {9675AF22-3E0C-4915-BD44-3B825DCAB746}
# 	2:5:Class:CRadarSeries
# 	2:10:HeaderFile:radarseries.h
# 	2:8:ImplFile:radarseries.cpp
# End Section
# Section Printing : {33CC2826-FFE9-4FB3-921E-AC8B03D47199}
# 	2:5:Class:CExpAvgFunction
# 	2:10:HeaderFile:expavgfunction.h
# 	2:8:ImplFile:expavgfunction.cpp
# End Section
# Section Printing : {22F8B8DE-1EEF-45CD-9E2D-679F29C80BDD}
# 	2:5:Class:CGradient
# 	2:10:HeaderFile:gradient.h
# 	2:8:ImplFile:gradient.cpp
# End Section
# Section Printing : {80ED6ECA-F58D-45BD-9BAB-F8E9C285EE92}
# 	2:5:Class:CArrowSeries
# 	2:10:HeaderFile:arrowseries.h
# 	2:8:ImplFile:arrowseries.cpp
# End Section
