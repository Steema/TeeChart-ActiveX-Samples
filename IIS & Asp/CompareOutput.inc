<HTML><HEAD><title>TeeChart Pro 2018 AX export format comparison</title>
<LINK REL=STYLESHEET TYPE="text/css" HREF="Style.css">
<meta http-equiv="x-ua-compatible" content="IE=10">
</HEAD>
<BODY onLoad="FillChart()">
<img src="TeeChartAX300x66.jpg">
<br><br>
<a href="ASPHome.htm">Back to Contents page</a>
<hr>
<p><FONT face=Verdana size=-1></p>
<h2>Example Live format</h2>

<h3>TeeChart Native Tee templates</h3>
<p><FONT face=Verdana size=-1>You can display Live Charts in ActiveX enabled browsers (Internet Explorer!) by placing the TeeChart OBJECT on the browser page. 
This Chart may be mousedrag zoomed or scrolled and its Axis labelling and grid have been modified with Custom Canvas events.</p>

<SCRIPT LANGUAGE=VBSCRIPT>

Sub FillChart()
  TChart1.Import.LoadFromURL("http://$SERVERPATH$/TeeChartAX/CompareOutput.asp?Type=tee")
  If TChart1.Canvas.IsScreenHighColor = False Then
    TChart1.Panel.Gradient.StartColor=vbYellow
    TChart1.Panel.Gradient.EndColor=vbWhite
  End If
  TChart1.Series(0).VerticalAxis = 2 'aBothVertAxis
  TChart1.Panel.MarginLeft = TChart1.Canvas.TextWidth("  Very bad :-|   ") / TChart1.Canvas.Width * 100
  TChart1.Axis.Left.Labels.Visible = False
  TChart1.Axis.Left.GridPen.Visible = False
  TChart1.Axis.Right.GridPen.Visible = False
  TChart1.Walls.Back.Pen.Visible = False
End Sub

Sub TChart1_OnAfterDraw()
  TChart1.Canvas.Font.Color = RGB(240,240,50)
  TChart1.Canvas.Font.Bold=True
  If TChart1.SeriesCount > 0 then
    If TChart1.Series(0).Count > 0 then
      TChart1.Canvas.TextOut TChart1.Axis.Left.Position, _
                     TChart1.Axis.Top.Position - TChart1.Canvas.TextHeight("H") - 10, _
                     "Max point: " & TChart1.Series(0).YValues.Maximum
    End if
  End if
end sub

Sub Window_Onload()
  FillChart
End sub

Sub RefreshPage()
  Document.Location="CompareOutput.asp"
End sub

Private Sub TChart1_OnBeforeDrawSeries()
Dim i, j, k

  Dim a
  a = Array("Very bad :-|", "Bad", "OK", "Good", "Excellent")
  
  j = 0
  if TChart1.SeriesCount > 0 then
    k = (TChart1.Series(0).YValues.Maximum - TChart1.Series(0).YValues.Minimum) / 4
    TChart1.Canvas.Pen.Width=1
    TChart1.Canvas.Pen.Style = 2 'psDot
    If TChart1.Canvas.IsScreenHighColor = False Then
      TChart1.Canvas.Pen.Color = vbBlack
    else
      TChart1.Canvas.Pen.Color = RGB(232, 232, 232)
    end If
    TChart1.Canvas.Brush.Color = 536870911 'clNone
    TChart1.Canvas.Brush.Style = 1 'bsClear
    TChart1.Canvas.ClipRectangle 0, TChart1.Axis.Top.Position-TChart1.Aspect.Height3D, _
				    TChart1.Axis.Right.Position+TChart1.Aspect.Width3D, _
                                    TChart1.Axis.Bottom.Position + 10
    For i = TChart1.Series(0).YValues.Minimum To TChart1.Series(0).YValues.Maximum Step k
     TChart1.Canvas.TextOut TChart1.Axis.Left.Position - TChart1.Canvas.TextWidth(a(j) & " "), _
			    TChart1.Axis.Left.CalcYPosValue(TChart1.Series(0).YValues.Minimum + (k * j)) _
			    - (TChart1.Canvas.TextHeight("H") / 2), A(j)
     j = j + 1
    Next
    j = 0
    TChart1.Canvas.ClipRectangle 0, TChart1.Axis.Top.Position - 5, TChart1.Axis.Right.Position + TChart1.Aspect.Width3D, TChart1.Axis.Bottom.Position
    For i = TChart1.Series(0).YValues.Minimum To TChart1.Series(0).YValues.Maximum Step k
     TChart1.Canvas.MoveTo TChart1.Axis.Left.Position, _
			   TChart1.Axis.Left.CalcYPosValue(TChart1.Series(0).YValues.Minimum + (k * j))
     TChart1.Canvas.LineTo TChart1.Axis.Left.Position + TChart1.Aspect.Width3D, _
			   TChart1.Axis.Left.CalcYPosValue(TChart1.Series(0).YValues.Minimum + (k * j)) _
			   - TChart1.Aspect.Height3D
     TChart1.Canvas.LineTo TChart1.Axis.Right.Position + TChart1.Aspect.Width3D, _
			   TChart1.Axis.Left.CalcYPosValue(TChart1.Series(0).YValues.Minimum + (k * j)) _
			   - TChart1.Aspect.Height3D
     j = j + 1
    Next
  End if
  TChart1.Canvas.UnClipRectangle
End Sub

</SCRIPT>

<p>Load the Chart with a button, IE Window_Onload event, or TeeChart timer event (here Chart loaded with Window_OnLoad). The first Chart will appear with a yellow gradient if TeeChart detects that the screen is not high colour.</p>
<p><input type="button" value="Refresh page" onclick="RefreshPage" name="cdmChart1"></p>

<OBJECT ID="TChart1" WIDTH=450 HEIGHT=290
 CLASSID="CLSID:CC0427C7-2124-4770-8847-F9EF4C50CDC2">
</OBJECT>
<p>Left mousebutton drag to zoom (down right=zoom, up left = undo zoom), right mousebutton drag to scroll</p> 

<hr>
<h2>Example Static formats</h2>

<h3>PNG</h3>

<IMG SRC="CompareOutput.asp?Type=png">

<br>

<h3>JPG</h3>

<IMG SRC="CompareOutput.asp?Type=jpg">

<br>

<h3>GIF</h3>

<p>GIF is presently supported with <b>RLE</b> encoding only so as not to infringe the Unisys <b>LZW</b> encoding patent. See the TeeChart tutorials or helpfile for more information.</p>

<IMG SRC="CompareOutput.asp?Type=gif">

<HR>Copyright &copy; 2019 Steema Software SL
</BODY></HTML>
