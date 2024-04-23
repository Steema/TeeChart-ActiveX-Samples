<%
if Request.Servervariables("LOCAL_ADDR")="::1" then
      ServerPath="localhost"
else
      ServerPath=Request.Servervariables("LOCAL_ADDR")
end if
%>

<HTML>

<META HTTP-EQUIV="Expires" CONTENT="0">
<HEAD>
<title>TeeChart v2021 Stream to browser example</title>
<LINK REL=STYLESHEET TYPE="text/css" HREF="Style.css">
<meta http-equiv="x-ua-compatible" content="IE=10">
</HEAD>
<BODY onLoad="Window_Onload()">

<script LANGUAGE="VBScript">
Sub Window_Onload()
 TChart2.Import.LoadFromURL("http://<%=ServerPath%>/TeeChartAX/TeeFromWeb.asp")
 TeeCommander2.ChartLink = TChart2.ChartLink
 TChart2.AddSeries(0) 
end sub

Sub TChart2_OnDblClick()
 TChart2.ShowEditor
 TChart2.StopMouse
end sub

Sub TChart1_OnMouseMove(Shift, X,Y)
' Example use of Chart event
' Uncomment code to see Mouseover message
' dim tmp
'  tmp = TChart2.Series(0).Clicked(X,Y)
'  if tmp <> -1 then
'    if TChart2.Series(0).YValues.Value(tmp)=TChart2.Series(0).YValues.Maximum then
'      msgbox("Max Y Value =" & TChart2.Series(0).YValues.Value(tmp) )
'    end if
'  end if
end sub
</script>

<SCRIPT LANGUAGE="JavaScript" FOR="TChart2" EVENT="OnAfterDraw()">
<!-- --></SCRIPT>

<IMG src="TeeChartAX300x66.jpg">
<br><br>
<A href="ASPHome.htm">Back to Contents page</a>
<hr>
<p>This example page calls a serverside script to create a Chart and return the 
result to the browser Chart as a native TeeChart template. The browser Chart imports
the template (inclusion of data is optional). No temporary files are used, output is
streamed directly to the browser. In this way TeeChart could alternatively stream all 
supported output image formats (eg. JPEG, PNG, GIF, Metafile) to the browser.</p>
<hr>
<p>
<OBJECT id=TeeCommander2 
data=data:application/x-oleobject;base64,XsiCzbc340ieiDHhQME8hlRQRjANVFRlZUNvbW1hbmRlcgAETGVmdAIAA1RvcAIABVdpZHRoA5ABBkhlaWdodAIhAAA= 
classid=clsid:EBFFF3FC-8805-42F8-8FFB-975AE3F5CE46></OBJECT>
</p>
<p>
<OBJECT id=TChart2 style="WIDTH: 606px; HEIGHT: 401px" 
classid=clsid:CC0427C7-2124-4770-8847-F9EF4C50CDC2><PARAM NAME="Base64" VALUE="VFBGMAtUQ2hhcnRDaGFydAAETGVmdAIAA1RvcAIABVdpZHRoA14CBkhlaWdodAORARJUaXRsZS5U&#13;&#10;ZXh0LlN0cmluZ3MBBghUZWVDaGFydAAAAAAAAAACAAAAAP////8="></OBJECT>
</p>

<HR>Copyright © 2023 Steema Software SL</BODY>
</html>