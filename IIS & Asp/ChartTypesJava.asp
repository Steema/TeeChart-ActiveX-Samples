<!--METADATA NAME="TeeChart Pro v2021 ActiveX Control" TYPE="TypeLib" UUID="{DE7847A7-A266-4AA9-AA68-16676652C9DB}"-->
<%@ LANGUAGE="JavaScript" %>

<%

 //***************************************************************
 // JScripted version of ChartTypes.asp. The syntax almost identical
 // to the VBScripted version
 //***************************************************************

 var ChartType
 var OutputStream
 var ViewType

  //=== Create Chart ======
  var Chart1 = Server.CreateObject('TeeChart.TChart');

  //=== Extract Chart type =======
  ChartType=Request.QueryString('ChartType');
  ViewType=Request.QueryString('View');

  //=== Add Series ==========
  Chart1.AddSeries(ChartType);

  //=== Setup Chart view =====
  Chart1.Aspect.View3D=ViewType;

  //=== Do Chart bits and pieces =====
  Chart1.Header.Text(0)='TeeChart Series Types';
  Chart1.Walls.Left.Transparent=true;
  Chart1.Panel.Gradient.Visible=true;
  Chart1.Panel.Gradient.StartColor=0xB3DEF5;
  Chart1.Panel.Gradient.EndColor=0xFACE87;

  //==== Size will be used for image output formats =====
  Chart1.Width = 450;
  Chart1.Height = 290;

  //=== use your methods eg via DB to populate Chart or...
  Chart1.Series(0).FillSampleValues(20);

  //=== Set output format
  OutputStream=Chart1.Export.asPNG.SaveToStream();

  //=== Cleanup the Chart =====
  Chart1=null;

  //===Send off the finished product ====
  Response.Binarywrite(OutputStream);

%>
