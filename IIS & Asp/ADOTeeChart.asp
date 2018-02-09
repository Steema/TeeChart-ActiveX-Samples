<!--METADATA NAME="TeeChart Pro v2018 ActiveX Control" TYPE="TypeLib" UUID="{DE7847A7-A266-4AA9-AA68-16676652C9DB}"-->
<%
   'Example uses TeeChart's example System ODBC datasource.


  'Send output to browser. 1st time in call CreatePage
  'then call RunChart method to build Chart contents
  if Request.QueryString("CreateChart")=1 Then
    Response.BinaryWrite(RunChart)
  else 
    CreatePage
  end if 

  Function RunChart()

    dim img
    dim Chart
    dim MyVar

    'Create Chart
    Set Chart = CreateObject("TeeChart.TChart")

    'Setup Series
    Chart.AddSeries(scBar)
    Chart.Series(0).Marks.Visible=False
    Chart.Series(0).asBar.BarStyle=bsPyramid

    'Chart appearance
    Chart.Legend.Visible=False
    Chart.Axis.Bottom.Labels.Angle=90
    Chart.Height=400
    Chart.Width=500
    Chart.Panel.Gradient.Visible=True
    Chart.Header.Text(0)="TeeChart ADO example"
    Chart.Header.Font.Bold=True
    Chart.Axis.Bottom.Title.Caption="Product name"
    Chart.Axis.Bottom.Title.Font.Bold=True 
    Chart.Axis.Left.Title.Font.Bold=True 

    'Create a random condition to vary the output
    Randomize
    MyVar = (40000)+CInt(rnd*20000)
     Chart.Axis.Left.Title.Caption="Order Item Totals > " & MyVar
           
    'Connect to database
    Set Conn = Server.CreateObject("ADODB.Connection")
    Set RSt = Server.CreateObject("ADODB.RecordSet")
    Conn.Open "DSN=TeeChart Pro System db"
    Rst.Open "select OrderNo, ItemTotal from orders where ItemTotal > " & MyVar, Conn, 1, 1

    'Connect Series to Recordset
    if RSt.RecordCount > 0 then 
      Chart.Series(0).Datasource = RSt
      Chart.Series(0).LabelsSource="OrderNo"
      Chart.Series(0).YValues.ValueSource="ItemTotal"
    else
      Chart.Series(0).Fillsamplevalues(10)
      Chart.Header.Text(0)="ADO database returned no values - using random data"
    end if

    'Cleanup and set Chart to send to browser 
    Rst.close
    Conn.close
    Set Rst=nothing
    Set Conn=nothing
    img=Chart.Export.asPNG.SaveToStream
    Set Chart=nothing
    RunChart=img

  End function

  Function CreatePage
    Response.Write("<html>" & chr(13))
    Response.Write("<HEAD><title>TeeChart Pro AX Control ADO with ASP example</title>" & chr(13))
    Response.Write("<LINK REL=STYLESHEET TYPE=""text/css"" HREF=""Style.css""></HEAD><BODY>" & chr(13))
    Response.Write("<img src=""TeeChartAX300x66.jpg"">" & chr(13))
    Response.Write("<br><br>" & chr(13))
    Response.Write("<a href=""ASPHome.htm"">Back to Contents page</a>" & chr(13))
    Response.Write("<hr>" & chr(13))
    Response.Write("<img id=Img1 src=""ADOTeeChart.asp?CreateChart=1"">" & chr(13))
    Response.Write("<p>Please note that server Datsources should be System DSNs not User DSNs.</p>" & chr(13))
    Response.Write("<HR>Copyright &copy; 2018 Steema Software SL</BODY></HTML>" & chr(13))
    Response.Write("</body>" & chr(13))
    Response.Write("</html>" & chr(13))
  End Function

%>
