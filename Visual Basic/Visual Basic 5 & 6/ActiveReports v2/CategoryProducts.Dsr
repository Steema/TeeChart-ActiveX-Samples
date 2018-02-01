VERSION 5.00
Begin {9EB8768B-CDFA-44DF-8F3E-857A8405E1DB} rptCategoryProducts 
   Caption         =   "Category Products"
   ClientHeight    =   10305
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   14625
   StartUpPosition =   3  'Windows Default
   _ExtentX        =   25797
   _ExtentY        =   18177
   SectionData     =   "CategoryProducts.dsx":0000
End
Attribute VB_Name = "rptCategoryProducts"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' The following sets Chart events to be associated with 'on-page' Chart
' The use of Withevents is not obligatory to use TeeChart but facilitates
' a link to events, a step not inherent to the ActiveReport page

' Please note:
' You should add TeeChart as a reference to the project using the VB menu
' Project:References and then browse for TeeChart6.ocx in the TeeChart
' installation folder.

Private WithEvents mChart As TeeChart.TChart
Attribute mChart.VB_VarHelpID = -1

Private Sub ActiveReport_PageStart()
  Me.TChart1.Series(0).Clear
End Sub

Private Sub ActiveReport_ReportStart()
  With Me.TChart1
    .Axis.Left.Inverted = True
    .Aspect.View3D = False
  End With
End Sub

Private Sub Detail_BeforePrint()
  mChart.Series(0).Add CDbl(txtUnitPrice.DataValue), txtProductName.Text, clTeeColor
End Sub

Private Sub mChart_OnAfterDraw()
Dim CurrentCountry As String
Dim outStr As String
  CurrentCountry = frmCategorySelection.cboCategories.List(frmCategorySelection.cboCategories.ListIndex)
  ' In this example with Withevents used, you may refer to Chart as mChart or Me.TChart1
  With Me.TChart1.Canvas
    .Font.Bold = True
    outStr = "Max unit price: " & Str$(Round(mChart.Series(0).XValues.Maximum))
    .TextOut TChart1.Axis.Left.Position - .TextWidth(outStr), 7, outStr
  End With
End Sub

Private Sub mChart_OnClick()
  'click not supported in report view mode
  'by ActiveReports
  mChart.ShowEditor
End Sub

Private Sub mChart_OnGetSeriesMark(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, MarkText As String)
 ' Modify each Mark here if required
 ' here with normal Marktext disabled
 ' ie. TChart1.Series(0).PercentFormat was "##0,## %", now: "##0,##"
 If CDbl(MarkText) > 23 Then
   MarkText = MarkText & " % (High!)"
 Else
   MarkText = MarkText & " %"
 End If
 ' MarkText = "$" & MarkText
End Sub

Private Sub PageHeader_Format()
  'Set on page Chart to use Withevents
  Set mChart = Me.TChart1
  
  ' add a gradient if the screen is high colour
  'If mChart.Canvas.IsScreenHighColor = True Then
  '  mChart.Panel.Gradient.EndColor = RGB(0, 32, 192)
  '  mChart.Header.Font.Color = RGB(204, 204, 204)
  '  mChart.Panel.Gradient.Visible = True
  'End If
End Sub
