<!--METADATA NAME="TeeChart Pro v2023 ActiveX Control" TYPE="TypeLib" UUID="{DE7847A7-A266-4AA9-AA68-16676652C9DB}"-->
<%
 ' Meta data section above to permit use of TeeChart constants in script

 Dim i
 Dim x

  Response.Buffer=true
  Set Chart1 = CreateObject("TeeChart.TChart")

  Chart1.Header.Text(0)="Performance"
  Chart1.AddSeries(scBar)
  Chart1.Aspect.View3D=False
  Chart1.Panel.Gradient.Visible=True
  Chart1.Panel.BevelOuter=2
  Chart1.Panel.BevelWidth=2

  Chart1.Axis.Bottom.Labels.Angle=90

  'use your methods eg via DB to populate Chart or...
  x=Now*10000
  For i = 0 to 5
  Chart1.Series(0).AddXY x, Rnd*x,"",clTeeColor
  x=x+100
  Next

  Response.BinaryWrite (Chart1.Export.asNative.SaveToStream(True))
%>
