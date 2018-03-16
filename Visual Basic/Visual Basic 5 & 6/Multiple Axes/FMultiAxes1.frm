VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   6150
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8565
   LinkTopic       =   "Form1"
   ScaleHeight     =   6150
   ScaleWidth      =   8565
   StartUpPosition =   3  'Windows Default
   Begin TeeChart.TeeCommander TeeCommander1 
      Align           =   1  'Align Top
      Height          =   495
      Left            =   0
      OleObjectBlob   =   "FMultiAxes1.frx":0000
      TabIndex        =   4
      Top             =   0
      Width           =   8565
   End
   Begin TeeChart.TChart TChart1 
      Align           =   1  'Align Top
      Height          =   5040
      Left            =   0
      OleObjectBlob   =   "FMultiAxes1.frx":004C
      TabIndex        =   1
      Top             =   495
      Width           =   8565
   End
   Begin VB.Frame Frame1 
      Height          =   675
      Left            =   -15
      TabIndex        =   0
      Top             =   5475
      Width           =   9345
      Begin VB.CheckBox Check2 
         Caption         =   "2D"
         Height          =   270
         Left            =   6750
         TabIndex        =   6
         Top             =   255
         Width           =   645
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Move Grid to front"
         Height          =   330
         Left            =   4830
         TabIndex        =   5
         Top             =   210
         Width           =   1755
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Then add Axes for Series2"
         Height          =   420
         Left            =   2340
         TabIndex        =   3
         Top             =   165
         Width           =   2265
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Scale Axes for Series1"
         Height          =   405
         Left            =   135
         TabIndex        =   2
         Top             =   180
         Width           =   2145
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
If Check1.Value = 1 Then
  TChart1.Axis.DrawAxesBeforeSeries = False
Else
  TChart1.Axis.DrawAxesBeforeSeries = True
End If
TChart1.Repaint
End Sub

Private Sub Check2_Click()
With TChart1.Aspect
  If Check2.Value = 1 Then
    .View3D = False
    .Rotation = 360
    .Elevation = 360
  Else
    .View3D = True
  End If
End With
End Sub

Private Sub Command1_Click()
Dim numVertaxis, numHorizaxis

With TChart1.Axis
  'reserve the lower part of the Chart for the Bar Series
  .Left.StartPosition = 50
  'Create a vertical Custom Axis
  numVertaxis = .AddCustom(False)
  numHorizaxis = .AddCustom(True)
  With .Custom(numVertaxis)
    .EndPosition = 40
    .AxisPen.Color = vbCyan
    .Title.Angle = 90
    .Ticks.Color = vbCyan
    .Title.Caption = "Deliveries (tons)"
    .Labels.Font.Color = vbButtonFace
    .Title.Font.Color = vbCyan
  End With
  With .Custom(numHorizaxis)
    .EndPosition = 35
    .AxisPen.Color = vbCyan
    .Ticks.Color = vbCyan
    .PositionPercent = 60
    .Labels.Font.Color = vbButtonFace
  End With
  'Associate Series(1)
  TChart1.Series(1).VerticalAxisCustom = numVertaxis
  TChart1.Series(1).HorizontalAxisCustom = numHorizaxis
End With
End Sub

Private Sub Command2_Click()
Dim numVertaxis, numHorizaxis

With TChart1.Axis
  'Create independantly scaled axes for Series(2)
  numVertaxis = .AddCustom(False)
  numHorizaxis = .AddCustom(True)
  With .Custom(numVertaxis)
    .EndPosition = 45
    .PositionPercent = 7 / 15 * 100
    .AxisPen.Color = vbWhite
    .Ticks.Color = vbWhite
    .Title.Angle = 90
    .Title.Font.Color = vbWhite
    .Title.Caption = "Variance"
    .Title.Font.Color = vbWhite
    .Labels.Font.Color = vbButtonFace
  End With
  With .Custom(numHorizaxis)
    .StartPosition = 7 / 15 * 100
    .AxisPen.Color = vbWhite
    .Ticks.Color = vbWhite
    .PositionPercent = 55
    .Labels.Font.Color = vbButtonFace
  End With
  'Associate Series(2)
  TChart1.Series(2).VerticalAxisCustom = numVertaxis
  TChart1.Series(2).HorizontalAxisCustom = numHorizaxis
End With
End Sub

Private Sub Form_Load()
  Dim i
  'Fill Series
  With TChart1
   For i = 1 To 15
    .Series(0).AddXY i, Rnd(i) * 10, "", clTeeColor
    If (i < 7) Or (i > 10) Then
      .Series(1).AddXY i, Rnd(i) / 2, "", clTeeColor
    Else
      .Series(1).AddNullXY i, Rnd(i) / 2, ""
    End If
      .Series(2).AddXY i, Rnd(i) / 10, "", clTeeColor
   Next i
   .Axis.Bottom.SetMinMax 0, 16
  End With
  'Associate Chart with TeeCommander
  TeeCommander1.Chart = TChart1
End Sub

Private Sub Form_Resize()
  Frame1.Width = ScaleWidth + 30
  TChart1.Height = ScaleHeight - Frame1.Height - TeeCommander1.Height
  Frame1.Top = TChart1.Height + TeeCommander1.Height - 105
End Sub


Private Sub TChart1_OnAfterDraw()
  If TChart1.Aspect.Rotation <> 360 Then
    Check2.Value = 0
  End If
End Sub



