<!--METADATA NAME="TeeChart Pro v2021 ActiveX Control" TYPE="TypeLib" UUID="{DE7847A7-A266-4AA9-AA68-16676652C9DB}"-->
<%
 'above Metadata line allows TeeChart constants to be used in the serverside script.
 'Alternatively include the "Includes/TChartConsts.vbs" constants file.

 Dim OutputType
 Dim OutputStream

  ' === Script Starting point ====
  ' The script starts here, creating the Chart and page then calling,
  ' upon request, each Chart format to import to the Client page.

  if Len(Request.QueryString("Type"))>1 Then
    Response.Expires = 0
    Response.BinaryWrite(RetrieveImage(Request.QueryString("Type")))
  else
    Response.Write(CreateChart)
  end if

  Function RetrieveImage(OutputType)
    Select Case OutputType
      Case "tee" RetrieveImage=Session("ExportTee")
      Case "png" RetrieveImage=Session("ExportPNG")
      Case "jpg" RetrieveImage=Session("ExportJPEG")
'      Case "gif" RetrieveImage=Session("ExportGIF")
    end Select
  End function

  Function CreateChart()

   Dim fso, f
   Const ForReading = 1

    Session("ExportTee")=0
    Session("ExportPNG")=0
    Session("ExportJPEG")=0
    Session("ExportGIF")=0

    '=== Create Chart ======
    Set Chart1 = CreateObject("TeeChart.TChart")

    '=== Do Chart bits and pieces =====
    Chart1.Header.Text(0)="Performance"
    Chart1.AddSeries(scLine)
    Chart1.Walls.Left.Transparent=True
    Chart1.Walls.Left.Color=RGB(35,70,128)
    Chart1.Panel.Gradient.Visible=True
    Chart1.Panel.Gradient.StartColor=&H7AA0FF
    Chart1.Panel.Gradient.EndColor=&HFACE87

    '==== Size will be used for image output formats =====
    Chart1.Width = 450
    Chart1.Height = 290

    '=== use your methods eg via DB to populate Chart or...
    Randomize
    For i=0 to 15
     Chart1.Series(0).Add Rnd*100, "", clTeeColor
    Next

    '=== Setup required output formats =======
    Session("ExportTee")=Chart1.Export.asNative.SaveToStream(True)
    Session("ExportPNG")=Chart1.Export.asPNG.SaveToStream
    Session("ExportJPEG")=Chart1.Export.asJPEG.SaveToStream
    'Session("ExportGIF")=Chart1.Export.asGIF.SaveToStream	
 
    '=== Find the local server path to the current script ====
    ' In case you use physical path from wwwroot then
    '  AppPath = Request.Servervariables("APPL_PHYSICAL_PATH") & "\TeeChartAX\"
     AppPath = server.MapPath("/TeeChartAX/") & "\"

    '=== Read in the HTML page to present to the client browser ======
    ' The HTML page recalls the script to return the Chart saved as
    ' session variables in its various formats. The HTML page also
    ' includes VbScript to act upon the Chart included as an <OBJECT>
    ' on the page.

    Set fso = CreateObject("Scripting.FileSystemObject")
    Set f = fso.OpenTextFile(AppPath & "compareOutput.inc", ForReading)

    CreateChart = f.ReadAll
	ServerPath="localhost"
	'The next code doesn't work properly in WindowsXP.
   ' if Request.Servervariables("LOCAL_ADDR")="::1" then
      'ServerPath="localhost"
   ' else
    '  ServerPath="localhost"
     ' ServerPath=Request.Servervariables("LOCAL_ADDR")
    'end if
    CreateChart = Replace(CreateChart,"$SERVERPATH$",ServerPath)

    '=== Cleanup =====
    f.Close

    Set Chart1=Nothing 

  End Function
%>
