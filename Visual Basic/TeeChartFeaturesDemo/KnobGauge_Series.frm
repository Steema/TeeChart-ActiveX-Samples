VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form KnobGauge_Series 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6825
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6825
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.CheckBox cbActiveCenter 
      Caption         =   "Active &center"
      Height          =   255
      Left            =   1800
      TabIndex        =   3
      Top             =   1320
      Value           =   1  'Checked
      Width           =   2295
   End
   Begin VB.CheckBox cbAnimate 
      Caption         =   "&Animate"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   1320
      Value           =   1  'Checked
      Width           =   1335
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5115
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"KnobGauge_Series.frx":0000
      Begin VB.Timer Timer2 
         Left            =   840
         Top             =   120
      End
      Begin VB.Timer Timer1 
         Left            =   240
         Top             =   120
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "KnobGauge_Series.frx":00B8
      Top             =   0
      Width           =   11475
   End
End
Attribute VB_Name = "KnobGauge_Series"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim Increment1, Increment2 As Double

Private Sub Check1_Click()
  Timer1.Enabled = cbAnimate.Value
  Timer2.Enabled = cbAnimate.Value
  If cbAnimate.Value Then
    cbActiveCenter.Value = False
  End If
  cbActiveCenter.Enabled = Not cbAnimate.Value
End Sub

Private Sub cbActiveCenter_Click()
  TChart1.Series(0).asKnobGauge.ActiveCenter = cbActiveCenter.Value
  TChart1.Series(1).asKnobGauge.ActiveCenter = cbActiveCenter.Value
End Sub

Private Sub cbAnimate_Click()
  Timer1.Enabled = cbAnimate.Value
  Timer2.Enabled = cbAnimate.Value
End Sub

Private Sub Form_Load()
  With TChart1
    .Aspect.View3D = False
    .Legend.Visible = False
    .Header.Font.Color = vbWhite
    .Header.Caption = "KnobGauge"
    .AddSeries scKnob
    .Series(0).asKnobGauge.Value = 1
    .Series(0).asKnobGauge.TotalAngle = 280
    .Series(0).asKnobGauge.ActiveCenter = True

    .AddSeries scKnob
    .Series(1).asKnobGauge.Value = 99
    .Series(1).asKnobGauge.TotalAngle = 280
    .Series(1).asKnobGauge.ActiveCenter = True
    
    'SetUpGauge1
    'SetUpGauge2

    Increment1 = 0.1
    Increment2 = 0.1
    
    Timer1.Interval = 50
    Timer2.Interval = 100
    Timer1.Enabled = True
    Timer2.Enabled = True
  End With
End Sub

Private Sub SetUpGauge1()
  Axis = TChart1.Axis.AddCustom(True)
  TChart1.AddSeries scNumericGauge
  TChart1.Series(2).HorizontalAxis = aCustomHorizAxis
  TChart1.Series(2).asNumericGauge.Embedded = True
  TChart1.Series(2).HorizontalAxisCustom = Axis
  
 ' NumericGauge1.TextMarker.Active:=False;
 ' NumericGauge1.UnitsMarker.Active:=False;
 ' NumericGauge1.ValueFormat:='###.0';
 
  TChart1.Series(2).asNumericGauge.ValueMarker.Shape.Font.Size = 12
End Sub

Private Sub SetUpGauge2()
  Axis = TChart1.Axis.AddCustom(True)
  TChart1.AddSeries scNumericGauge
  TChart1.Series(3).HorizontalAxis = aCustomHorizAxis
  TChart1.Series(3).asNumericGauge.Embedded = True
  TChart1.Series(3).HorizontalAxisCustom = Axis
 ' NumericGauge2.TextMarker.Active:=False;
 ' NumericGauge2.UnitsMarker.Active:=False;
 ' NumericGauge2.ValueFormat:='###.0';
  TChart1.Series(3).asNumericGauge.ValueMarker.Shape.Font.Size = 12
End Sub

Private Sub DrawNGauge1()
  TChart1.Series(2).asNumericGauge.SetCustomBounds TChart1.Series(0).asKnobGauge.CircleXCenter - 30, _
    TChart1.Series(0).asKnobGauge.CircleYCenter - TChart1.Series(0).asKnobGauge.XRadius + 10, _
    TChart1.Series(0).asKnobGauge.CircleXCenter + 30, _
    TChart1.Series(0).asKnobGauge.CircleYCenter - TChart1.Series(0).asKnobGauge.YRadius + 50
  
  TChart1.Series(2).asNumericGauge.Value = TChart1.Series(0).asKnobGauge.Value
End Sub

Private Sub DrawNGauge2()
  TChart1.Series(3).asNumericGauge.SetCustomBounds TChart1.Series(1).asKnobGauge.CircleXCenter - 30, _
    TChart1.Series(1).asKnobGauge.CircleYCenter - TChart1.Series(1).asKnobGauge.XRadius + 10, _
    TChart1.Series(1).asKnobGauge.CircleXCenter + 30, _
    TChart1.Series(1).asKnobGauge.CircleYCenter - TChart1.Series(1).asKnobGauge.YRadius + 50
  
  TChart1.Series(3).asNumericGauge.Value = TChart1.Series(1).asKnobGauge.Value
End Sub

Private Sub TChart1_OnSeriesAfterDrawValues(ByVal SeriesIndex As Long)
If SeriesIndex = 0 Then
'  DrawNGauge1
End If
If SeriesIndex = 1 Then
'  DrawNGauge2
End If
End Sub

Private Sub Timer1_Timer()
  If (TChart1.Series(0).asKnobGauge.Value >= 100) Then
    Increment1 = -0.1
  End If
  If (TChart1.Series(0).asKnobGauge.Value <= 0) Then
    Increment1 = 0.1
  End If
  TChart1.Series(0).asKnobGauge.Value = TChart1.Series(0).asKnobGauge.Value + Increment1
End Sub

Private Sub Timer2_Timer()
  If (TChart1.Series(1).asKnobGauge.Value >= 100) Then
    Increment2 = -0.1
  End If
  If (TChart1.Series(1).asKnobGauge.Value <= 0) Then
    Increment2 = 0.1
  End If
  TChart1.Series(1).asKnobGauge.Value = TChart1.Series(1).asKnobGauge.Value + Increment2
End Sub
