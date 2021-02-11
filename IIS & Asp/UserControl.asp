<%
 Function RunChart() 
   'See TeeChart's VB Examples folder 'UserControl' for the
   'sourcecode to the TeeChart UserControl

   Set Chart1 = CreateObject("TeeChartVBCtl.TeeChartFrm")
   RunChart=Chart1.MyStreamChart(0)
   Set Chart1=Nothing
 End Function

 Function CreatePage
   Response.Write("<html><META HTTP-EQUIV=""Expires"" CONTENT=""0"">" & chr(13))
   Response.Write("<SCRIPT LANGUAGE=VBSCRIPT>" & chr(13))
   Response.Write(" Sub Refresh()" & chr(13))
   Response.Write("   Img1.src=""UserControl.asp?CreateChart=1""" & chr(13))
   Response.Write(" End sub" & chr(13))
   Response.Write("</SCRIPT>" & chr(13))
   Response.Write("<HEAD><title>TeeChart Pro AX Control in VB ActiveX UserControl project</title>" & chr(13))
   Response.Write("<LINK REL=STYLESHEET TYPE=""text/css"" HREF=""Style.css""></HEAD><BODY>" & chr(13))
   Response.Write("<img src=""TeeChartAX300x66.jpg"">" & chr(13))
   Response.Write("<br><br>" & chr(13))
   Response.Write("<a href=""ASPHome.htm"">Back to Contents page</a>" & chr(13))
   Response.Write("<hr>" & chr(13))
   Response.Write("<img id=Img1 src=""UserControl.asp?CreateChart=1"">")
   Response.Write("<p><input type=""button"" value=""Re-populate Chart"" onclick=""Refresh"" name=""cdmChart1""></p>" & chr(13))
   Response.Write("<p>If the UserControl Image does not appear it may be related to rights issues or " & chr(13))
   Response.Write("or a registration problem.<br>To test you could recompile the UserControl in the 'ActiveX Control' VB Example folder and re-register it with regsvr32.</p>" & chr(13))
   Response.Write("<HR>Copyright &copy; 2021 Steema Software SL" & chr(13))
   Response.Write("</body>" & chr(13))
   Response.Write("</html>" & chr(13))
 End Function

 if Request.QueryString("CreateChart")=1 Then
   Response.Expires=0
   Response.BinaryWrite(RunChart)
 else
   CreatePage
 end if 
%>
