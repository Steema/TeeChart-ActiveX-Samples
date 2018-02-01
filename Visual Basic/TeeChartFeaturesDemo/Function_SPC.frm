VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Function_SPC 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.VScrollBar VScroll1 
      Height          =   300
      Left            =   2280
      Max             =   1
      Min             =   100
      TabIndex        =   3
      Top             =   825
      Value           =   1
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1815
      TabIndex        =   2
      Text            =   "1"
      Top             =   810
      Width           =   435
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5700
      Left            =   0
      TabIndex        =   0
      Top             =   1215
      Width           =   11505
      Base64          =   $"Function_SPC.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   750
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Function_SPC.frx":29C0
      Top             =   0
      Width           =   11730
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Average Series &Period:"
      Height          =   195
      Left            =   90
      TabIndex        =   4
      Top             =   885
      Width           =   1620
   End
End
Attribute VB_Name = "Function_SPC"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

' Return the smallest parameter value.
Private Function Min(ParamArray values() As Variant) As _
    Variant
Dim i As Integer
Dim min_value As Variant

    min_value = values(LBound(values))
    For i = LBound(values) + 1 To UBound(values)
        If min_value > values(i) Then min_value = values(i)
    Next i

    Min = min_value
End Function

' Return the smallest parameter value.
Private Function Max(ParamArray values() As Variant) As Variant

Dim i As Integer
Dim max_value As Variant

    max_value = values(LBound(values))
    For i = LBound(values) + 1 To UBound(values)
        If max_value < values(i) Then
          max_value = values(i)
        End If
    Next i

    Max = max_value
End Function

Private Function SubGroupConst(n As Integer) As Double
    Select Case n
    Case 1:  SubGroupConst = 2.66
    Case 2:  SubGroupConst = 1.88
    Case 3:  SubGroupConst = 1.023
    Case 4:  SubGroupConst = 0.729
    Case 5:  SubGroupConst = 0.577
    Case 6:  SubGroupConst = 0.483
    Case Else
      SubGroupConst = 2.66
    End Select
End Function

Sub Form_Load()
  With TChart1
    Text2.Text = TChart1.Series(1).FunctionType.Period
    CallButton
  End With
End Sub

Private Sub TChart1_OnGetSeriesPointerStyle(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, AStyle As TeeChart.EPointerStyle)
  If SeriesIndex = 1 Then
  If CheckRules(TChart1.Series(SeriesIndex), ValueIndex) Then
    AStyle = psRectangle
  Else
    AStyle = psCircle
  End If
  End If
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  ' change the Period value (number of points)
  TChart1.Series(1).FunctionType.Period = VScroll1.Value
  CallButton
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = LTrim$(Str$(VScroll1.Value))
End Sub


Private Function CheckRules(Series As ISeries, ValueIndex As Long) As Boolean
  CheckRules = Rule4(Series, ValueIndex) Or Rule3(Series, ValueIndex) Or Rule2(Series, ValueIndex) _
      Or Rule1(Series, ValueIndex)
End Function

' A single point outside the control limits
Private Function Rule1(Series As ISeries, ValueIndex As Long) As Boolean
  result = (Series.YValues.Value(ValueIndex) > TChart1.Tools.Items(4).asColorLine.Value) Or _
          (Series.YValues.Value(ValueIndex) < TChart1.Tools.Items(5).asColorLine.Value)

  If result Then
    Series.PointColor(ValueIndex) = vbRed
  Else
    Series.PointColor(ValueIndex) = Series.Color
  End If
  
  Rule1 = result
End Function

' Two of three pts outside the two sigma limit
Private Function Rule2(Series As ISeries, ValueIndex As Long) As Boolean
Dim Count As Integer

  Count = 1
  If ValueIndex > 1 Then
    If Series.YValues.Value(ValueIndex) > TChart1.Tools.Items(2).asColorLine.Value Then
      If Series.YValues.Value(ValueIndex - 2) > TChart1.Tools.Items(2).asColorLine.Value Then
        Count = Count + 1
      End If
      If Series.YValues.Value(ValueIndex - 1) > TChart1.Tools.Items(2).asColorLine.Value Then
        Count = Count + 1
      End If
    End If

    If Count = 1 Then
      If Series.YValues.Value(ValueIndex) < TChart1.Tools.Items(3).asColorLine.Value Then
        If Series.YValues.Value(ValueIndex - 2) < TChart1.Tools.Items(3).asColorLine.Value Then
          Count = Count + 1
        End If
        If Series.YValues.Value(ValueIndex - 1) < TChart1.Tools.Items(3).asColorLine.Value Then
          Count = Count + 1
        End If
      End If
    End If
  End If

  result = Count > 1

  If result Then
    Series.PointColor(ValueIndex) = vbGreen
  Else
    Series.PointColor(ValueIndex) = Series.Color
  End If
  
  Rule2 = result
End Function

' Four of Five pts outside the one sigma limit
Private Function Rule3(Series As ISeries, ValueIndex As Long) As Boolean
Dim Count, i As Integer
  Count = 1

  If ValueIndex > 3 Then
    If Series.YValues.Value(ValueIndex) > TChart1.Tools.Items(0).asColorLine.Value Then
      For i = ValueIndex - 4 To ValueIndex - 1
        If Series.YValues.Value(i) > TChart1.Tools.Items(0).asColorLine.Value Then
          Count = Count + 1
        End If
      Next i
    End If
  
    If (Count = 1) And (Series.YValues.Value(ValueIndex) < TChart1.Tools.Items(1).asColorLine.Value) Then
      For i = ValueIndex - 4 To ValueIndex - 1
        If Series.YValues.Value(i) < TChart1.Tools.Items(1).asColorLine.Value Then
          Count = Count + 1
        End If
      Next i
    End If
  End If

  result = Count > 3

  If result Then
    Series.PointColor(ValueIndex) = vbBlack
  Else
    Series.PointColor(ValueIndex) = Series.Color
  End If
  
  Rule3 = result
End Function

' Eight in a row on the same side of centerline
Private Function Rule4(Series As ISeries, ValueIndex As Long) As Boolean
Dim i As Integer
Dim Avg As Double

  result = False
  Avg = TChart1.Series(3).YValues.Value(0)

  If ValueIndex > 7 Then
    For i = ValueIndex - 7 To ValueIndex
      If Series.YValues.Value(i) < Avg Then
        result = False
        i = ValueIndex
      Else
        result = True
      End If
    Next i
    
    If Not result Then
      For i = ValueIndex - 7 To ValueIndex
        If Series.YValues.Value(i) > Avg Then
          result = False
          i = ValueIndex
        Else
          result = True
        End If
      Next i
    End If
  End If

  If result Then
    Series.PointColor(ValueIndex) = vbYellow
  Else
    Series.PointColor(ValueIndex) = Series.Color
  End If
  Rule4 = result
End Function

Private Sub CallButton()
Dim Avg, StdDev, RAvg, tmp As Double
Dim i As Integer
Dim RSeries, RAvgSeries As Integer

  RSeries = TChart1.AddSeries(scLine)
  RAvgSeries = TChart1.AddSeries(scLine)

  TChart1.Series(RSeries).Active = False
  TChart1.Series(RAvgSeries).Active = False

  For i = 1 To TChart1.Series(1).Count - 1
    TChart1.Series(RSeries).AddXY TChart1.Series(1).XValues.Value(i), Math.Abs(TChart1.Series(1).YValues.Value(i) - TChart1.Series(1).YValues.Value(i - 1)), "", clTeeColor
  Next i

  TChart1.Series(RAvgSeries).SetFunction tfAverage
  TChart1.Series(RAvgSeries).DataSource = TChart1.Series(RSeries)

  Avg = TChart1.Series(3).YValues.Value(0)
  StdDev = TChart1.Series(2).YValues.Value(0)
  RAvg = TChart1.Series(RAvgSeries).YValues.Value(0)

  TChart1.Tools.Items(4).asColorLine.Value = Avg + (RAvg * SubGroupConst(VScroll1.Value))
  TChart1.Tools.Items(5).asColorLine.Value = Avg - (RAvg * SubGroupConst(VScroll1.Value))
  TChart1.Tools.Items(0).asColorLine.Value = Avg + ((TChart1.Tools.Items(4).asColorLine.Value - Avg) * (1 / 3))
  TChart1.Tools.Items(1).asColorLine.Value = Avg - ((TChart1.Tools.Items(4).asColorLine.Value - Avg) * (1 / 3))
  TChart1.Tools.Items(2).asColorLine.Value = Avg + ((TChart1.Tools.Items(4).asColorLine.Value - Avg) * (2 / 3))
  TChart1.Tools.Items(3).asColorLine.Value = Avg - ((TChart1.Tools.Items(4).asColorLine.Value - Avg) * (2 / 3))
  
  TChart1.Axis.Left.SetMinMax Min(TChart1.Tools.Items(5).asColorLine.Value, TChart1.Series(1).YValues.Minimum) - StdDev, _
                              Max(TChart1.Tools.Items(4).asColorLine.Value, TChart1.Series(1).YValues.Maximum) + StdDev
  TChart1.Axis.Bottom.Labels.Style = talValue

  ' Dummy series for rules legend
  TChart1.Series(4).Clear
  tmp = TChart1.Axis.Left.Maximum * 2
  
  TChart1.Series(4).Add tmp, "A single point outside the control limits", vbRed
  TChart1.Series(4).Add tmp, "Two of three points outside the two sigma limit", vbGreen
  TChart1.Series(4).Add tmp, "Four of Five points outside the one sigma limit", vbPurple
  TChart1.Series(4).Add tmp, "Eight in a row on the same side of centerline", vbYellow

  For i = 0 To TChart1.SeriesCount - 1
    If TChart1.Series(i).SeriesType <> TChart1.Series(4).SeriesType Then
      TChart1.Series(i).ShowInLegend = False
    End If
  Next i

  TChart1.Legend.Alignment = laBottom
  TChart1.Legend.LegendStyle = lsValues
  TChart1.Legend.TextStyle = ltsPlain
End Sub
