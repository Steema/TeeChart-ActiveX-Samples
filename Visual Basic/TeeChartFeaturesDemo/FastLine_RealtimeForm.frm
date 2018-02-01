VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form FastLine_RealtimeForm 
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
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   0
      Top             =   1590
      Width           =   11505
      Base64          =   $"FastLine_RealtimeForm.frx":0000
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Fast Pen"
      Height          =   195
      Left            =   5895
      TabIndex        =   7
      Top             =   1260
      Value           =   1  'Checked
      Width           =   1050
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   5085
      TabIndex        =   6
      Text            =   "5000"
      Top             =   1215
      Width           =   735
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Start !"
      Height          =   330
      Left            =   90
      TabIndex        =   4
      Top             =   1215
      Width           =   870
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Draw all points"
      Height          =   195
      Left            =   1215
      TabIndex        =   3
      Top             =   1260
      Value           =   1  'Checked
      Width           =   1365
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   3870
      TabIndex        =   2
      Text            =   "10000"
      Top             =   1215
      Width           =   690
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1065
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Text            =   "FastLine_RealtimeForm.frx":00CC
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      Caption         =   "Scroll :"
      Height          =   195
      Left            =   4590
      TabIndex        =   8
      Top             =   1260
      Width           =   600
   End
   Begin VB.Label Label1 
      Caption         =   "Total Points :"
      Height          =   195
      Left            =   2790
      TabIndex        =   5
      Top             =   1260
      Width           =   1005
   End
End
Attribute VB_Name = "FastLine_RealtimeForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Stopped As Boolean      ' are we in "loop" mode ?
Dim MaxPoints As Integer    ' total points per Series
Dim ScrollPoints As Integer ' number of points to scroll when filled

Private Sub Check1_Click()
    TChart1.Series(0).asFastLine.DrawAllPoints = Check1.Value
    TChart1.Series(1).asFastLine.DrawAllPoints = Check1.Value
End Sub

Private Sub Check2_Click()
  ' When FastLine series have AutoRepaint = False ,
  ' setting FastPen to True increases speed.
  TChart1.Series(0).asFastLine.FastPen = Check2.Value
  TChart1.Series(1).asFastLine.FastPen = Check2.Value
End Sub

' This button starts / stops a fast loop to add points
' to Series1 and Series2.
Private Sub Command1_Click()
With TChart1
  If Stopped Then
    ' Start loop...
    Command1.Caption = "&Stop"
    Text2.Enabled = False
    Text3.Enabled = False

    ' Prepare variables
    MaxPoints = Text2.Text
    ScrollPoints = Text3.Text
    .Axis.Bottom.SetMinMax 1, MaxPoints

    ' Clear
    .Series(0).Clear
    .Series(1).Clear
    DoEvents

    Stopped = False

    ' Start loop
    Do While Stopped = False
      ' Add one more point
      RealTimeAdd (0)
      RealTimeAdd (1)

      ' Delete and Scroll points
      If .Series(0).Count > (MaxPoints - 1) Then
         DoScrollPoints
      End If
    Loop
  Else
    ' Finish
    Stopped = True
    Command1.Caption = "&Start"
    Text2.Enabled = True
    Text3.Enabled = True
  End If
End With
End Sub

' Adds a new random point to Series
Private Sub RealTimeAdd(s As Integer)
  Dim XValue, YValue As Double
  With TChart1
    If .Series(s).Count = 0 Then ' First random point
      YValue = Rnd * 10000
      XValue = 1
    Else
      ' Next random point
      YValue = .Series(s).YValues.Last + Rnd * 10 - 5
      XValue = .Series(s).XValues.Last + 1
    End If
    ' Add new point
    .Series(s).asFastLine.AddRealTime XValue, YValue, "", clTeeColor
  End With
End Sub

' When the chart is filled with points, this procedure
' deletes and scrolls points to the left.
Private Sub DoScrollPoints()
  Dim tmp, tmpMin, tmpMax As Double
  ' Delete multiple points with a single call.
  ' Much faster than deleting points using a loop.
  With TChart1
    .Series(0).DeleteRange 0, ScrollPoints
    .Series(1).DeleteRange 0, ScrollPoints

    ' Scroll horizontal bottom axis
    tmp = .Series(0).XValues.Last
    .Axis.Bottom.SetMinMax tmp - MaxPoints + ScrollPoints, tmp + ScrollPoints

    ' Scroll vertical left axis
    tmpMin = .Series(0).YValues.Minimum
    If .Series(1).YValues.Minimum < tmpMin Then
        tmpMin = .Series(1).YValues.Minimum
    End If

    tmpMax = .Series(0).YValues.Maximum
    If .Series(1).YValues.Maximum > tmpMax Then
        tmpMax = .Series(1).YValues.Maximum
    End If

    .Axis.Left.SetMinMax tmpMin - tmpMin / 5, tmpMax + tmpMax / 5

    ' Do chart repaint after deleting and scrolling
    DoEvents
  End With
End Sub
  

Private Sub Form_Load()
With TChart1
  .AddSeries scFastLine
  .AddSeries scFastLine

  ' Prepare chart for maximum speed:
  .ClipPoints = False
  .Header.Visible = False
  .Legend.Visible = False
  .Axis.Left.AxisPen.Width = 1
  .Axis.Bottom.AxisPen.Width = 1
  .Axis.Bottom.Labels.RoundFirstLabel = False
  .Aspect.View3D = False

  ' Private variables for this demo:
  Stopped = True
  MaxPoints = 10000
  ScrollPoints = 5000

  ' Prepare series.
  ' Disable AutoRepaint and X Order

  ' AutoRepaint=False means "real-time" drawing mode.
  ' Points are displayed just after adding them,
  ' without redrawing the whole chart.
  .Series(0).asFastLine.AutoRepaint = False
  .Series(1).asFastLine.AutoRepaint = False

  ' Set Ordering to none, to increment speed when adding points
  .Series(0).XValues.Order = loNone
  .Series(1).XValues.Order = loNone

  ' Initialize axis scales
  .Axis.Left.SetMinMax 0, 10000
  .Axis.Bottom.SetMinMax 1, MaxPoints

  'For Windows NT, 2000 and XP only:
  ' Speed realtime painting with solid pens of width 1.
  .Series(0).asFastLine.FastPen = True
  .Series(1).asFastLine.FastPen = True

  ' Set axis calculations in "fast mode".
  ' Note: For Windows Me and 98 might produce bad drawings when
  '       chart zoom is very big.
  .Axis.FastCalc = True
End With
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Stopped = True ' Break loop to allow close form
End Sub
