Imports System.IO

Public Class genchart
  Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

  'This call is required by the Web Form Designer.
  <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

  End Sub

  Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
    'CODEGEN: This method call is required by the Web Form Designer
    'Do not modify it using the code editor.
    InitializeComponent()
  End Sub

#End Region

  Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    Dim TChart1 As TeeChart.TChartClass
    TChart1 = New TeeChart.TChartClass()

    TChart1.AddSeries(TeeChart.ESeriesClass.scBar)
    TChart1.Series(0).FillSampleValues(10)
    TChart1.Header.Text.Add("events in .NET example")
    TChart1.Header.Font.Size = 10

    Response.BinaryWrite(TChart1.Export.asNative.SaveToStream(True))

  End Sub

End Class
