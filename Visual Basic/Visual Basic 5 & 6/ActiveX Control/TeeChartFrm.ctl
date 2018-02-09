VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2018.ocx"
Begin VB.UserControl TeeChartFrm 
   ClientHeight    =   5055
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6855
   ScaleHeight     =   5055
   ScaleWidth      =   6855
   Begin TeeChart.TChart TChart1 
      Height          =   4995
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6795
      Base64          =   $"TeeChartFrm.ctx":0000
   End
End
Attribute VB_Name = "TeeChartFrm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
' To create use:
' TeeChart2016VBCtl.TeeChartForm

Private Sub TChart1_OnAfterDraw()
  With TChart1
    .Canvas.Font.Bold = True
    .Canvas.TextOut .Axis.Right.Position + 20, .Axis.Bottom.Position - 50, _
             "Y Data range:"
    .Canvas.TextOut .Axis.Right.Position + 20, .Axis.Bottom.Position - 50 + .Canvas.TextHeight("D") + 5, _
             Str$(.Series(0).YValues.Maximum - .Series(0).YValues.Minimum)
  End With
End Sub

Private Sub TChart1_OnBeforeDrawSeries()
Dim XVal, YVal
  
  With TChart1
   For i = 0 To .Series(0).Count - 1
    If .Series(0).YValues.Value(i) = .Series(0).YValues.Maximum Then
        XVal = .Series(0).CalcXPos(i)
        YVal = .Series(0).CalcYPos(i)
    End If
   Next i
   With .Tools.Items(0).asAnnotation
    .Text = "Data sensitive." & Chr$(13) & "Highest val: " & TChart1.Series(0).YValues.Maximum
    .Shape.Left = XVal
    .Shape.Top = YVal
    .Shape.Transparency = 30
   End With
  End With
End Sub

Private Sub TChart1_OnGetLegendText(ByVal LegendStyle As Long, ByVal ValueIndex As Long, LegendText As String)
 LegendText = LegendText & " Index:" & Str$(ValueIndex)
End Sub

Private Sub UserControl_Initialize()
  TChart1.Series(0).Marks.Visible = True
  TChart1.Series(0).FillSampleValues 10
End Sub

' not used
Public Property Let SaveFile(ByVal Filepath As String, ByVal Filename As String)

End Property

Public Sub MySaveToFile(ByVal Filepath As String, ByVal Filename As String)
  TChart1.Export.asPNG.SaveToFile Filepath & Filename
End Sub

Public Sub ChangeBackDrop(ByVal Filename As String)
  TChart1.Panel.BackImageLoad Filename
End Sub

Public Function MyStreamChart(ByVal OutputType As Integer) As Variant
  Select Case OutputType
    Case 0: MyStreamChart = (TChart1.Export.asPNG.SaveToStream)
    Case 1: MyStreamChart = (TChart1.Export.asNative.SaveToStream(True))
  End Select
End Function


