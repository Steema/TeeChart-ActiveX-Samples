<!--METADATA NAME="TeeChart Pro v2018 ActiveX Control" TYPE="TypeLib" UUID="{DE7847A7-A266-4AA9-AA68-16676652C9DB}"-->
<%
 'above Metadata line allows TeeChart constants to be used in the serverside script.
 'Alternatively include the "Includes/TChartConsts.vbs" constants file.

 Dim ChartType
 Dim OutputStream
 Dim ViewType

  '=== Create Chart ======
  Set Chart1 = CreateObject("TeeChart.TChart")

  '=== Extract Chart type =======
  ChartType=Request.QueryString("ChartType")
  ViewType=Request.QueryString("View")

  '=== Add Series ==========
  Chart1.AddSeries(ChartType)

  '=== Setup Chart view =====
  Chart1.Aspect.View3D=ViewType

  '=== Do Chart bits and pieces =====
  Chart1.Header.Text(0)="TeeChart Series Types"
  Chart1.Walls.Left.Transparent=True
  Chart1.Walls.Left.Color=RGB(35,70,128)
  Chart1.Panel.Gradient.Visible=True
  Chart1.Panel.Gradient.StartColor=&HB3DEF5 '&H8CB4D2
  Chart1.Panel.Gradient.EndColor=&HFACE87

  '==== Size will be used for image output formats =====
  Chart1.Width = 450
  Chart1.Height = 290

  '=== use your methods eg via DB to populate Chart or...
  Chart1.Series(0).FillSampleValues 20

  '=== Set output format
  OutputStream=Chart1.Export.asPNG.SaveToStream

  '=== Cleanup the Chart =====
  Set Chart1=Nothing

  '===Send off the finished product ====
  Response.Binarywrite OutputStream
%>
