<!--METADATA NAME="TeeChart Pro v2024 ActiveX Control" TYPE="TypeLib" UUID="{DE7847A7-A266-4AA9-AA68-16676652C9DB}"-->
<%
 ' Metadata section above to permit use of TeeChart constants in script

 Function RunChart()

   Set Chart1 = CreateObject("TeeChart.TChart")

   '=== Find the local server path to the current script ====
   ' In case you use physical path from wwwroot then
   '  AppPath = Request.Servervariables("APPL_PHYSICAL_PATH") & "\TeeChartAX\"

   AppPath = server.MapPath("/TeeChartAX/") & "\"

   Chart1.Import.LoadFromFile(AppPath & "SalesReport.tee")
   Chart1.Width=500
   Chart1.Height=350
   Chart1.Tools(0).asAnnotation.Text="Year 2000"

   'use your methods eg via DB to populate Chart or...
   For i = 1 to 12
     Chart1.Series(0).AddXY i, Rnd*10,"",clTeeColor
   Next

   'example format for PNG export
   RunChart=(Chart1.Export.asPNG.SaveToStream)
   Set Chart1=Nothing
 End Function

 Function CreatePage
   Response.Expires = 0
   Response.Write("<html>" & chr(13))
   Response.Write("<HEAD><title>TeeChart Pro AX Control using Tee Template files serverside</title>" & chr(13))
   Response.Write("<LINK REL=STYLESHEET TYPE=""text/css"" HREF=""Style.css""></HEAD><BODY>" & chr(13))
   Response.Write("<img src=""TeeChartAX300x66.jpg"">" & chr(13))
   Response.Write("<br><br>" & chr(13))
   Response.Write("<a href=""ASPHome.htm"">Back to Contents page</a>" & chr(13))
   Response.Write("<hr>" & chr(13))
   Response.Write("<img id=Img1 src=""ShowSalesYear.asp?CreateChart=1"">" & chr(13))
   Response.Write("<HR>Copyright &copy; 2024 Steema Software SL" & chr(13))
   Response.Write("</body>" & chr(13))
   Response.Write("</html>" & chr(13))
 End Function

 if Request.QueryString("CreateChart")=1 Then
   Response.BinaryWrite(RunChart)
 else 
   CreatePage
 end if 
%>
