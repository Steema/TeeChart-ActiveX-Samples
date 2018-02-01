VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form CircularGauge_Embedded 
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
   Begin VB.Timer Timer1 
      Left            =   5130
      Top             =   3195
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"CircularGauge_Embedded.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "CircularGauge_Embedded.frx":0EF6
      Top             =   0
      Width           =   11505
   End
End
Attribute VB_Name = "CircularGauge_Embedded"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Increment As Double


Private Sub Form_Load()
  With TChart1
    .Aspect.View3D = False
    .Legend.Visible = False
    .Header.Font.Color = vbWhite
    .Header.Caption = "Embedded Gauges"
    
    .AddSeries scCircularGauge
    With .Series(0).asCircularGauge
      .RotationAngle = 270
      .TotalAngle = 180
      .Axis.Labels.Font.Size = 8
      .RedLine.Visible = False
      .GreenLine.Visible = False
      .Value = 0
      .GreenLine.Pen.Visible = False
      .RedLine.Pen.Visible = False
    End With
  End With
  
  SetUpNGauge
  SetUpLGauge

  Increment = 0
  Timer1.Interval = 50
  Timer1.Enabled = True
  
  Randomize
End Sub

Private Sub TChart1_OnSeriesBeforeDrawValues(ByVal SeriesIndex As Long)

  DrawNGauge
  DrawLGauge

End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub SetUpNGauge()
  TChart1.AddSeries scNumericGauge
  a = TChart1.Axis.AddCustom(True)
  TChart1.Series(1).asNumericGauge.Embedded = True
  TChart1.Series(1).HorizontalAxisCustom = a
  TChart1.Series(1).HorizontalAxis = aCustomHorizAxis
  TChart1.Series(1).asNumericGauge.TextMarker.Shape.Color = vbRed
  TChart1.Series(1).asNumericGauge.TextMarker.Shape.Font.Size = 8
  TChart1.Series(1).asNumericGauge.UnitsMarker.Shape.Color = vbBlue
  TChart1.Series(1).asNumericGauge.UnitsMarker.Shape.Font.Size = 8
  TChart1.Series(1).ValueFormat = "##00.0"
  TChart1.Series(1).asNumericGauge.ValueMarker.Shape.Font.Size = 12
  
  TChart1.Series(1).asNumericGauge.Frame.Visible = False
End Sub

Private Sub SetUpLGauge()
  AxisH = TChart1.Axis.AddCustom(True)
  AxisV = TChart1.Axis.AddCustom(False)
    
  TChart1.AddSeries scLinearGauge
  TChart1.Series(2).HorizontalAxis = aCustomHorizAxis
  TChart1.Series(2).VerticalAxis = aCustomVertAxis
  TChart1.Series(2).asLinearGauge.Embedded = True
  TChart1.Series(2).HorizontalAxisCustom = AxisH
  TChart1.Series(2).asLinearGauge.Horizontal = False
  TChart1.Series(2).VerticalAxisCustom = AxisV
  With TChart1.Series(2).asLinearGauge
    .Axis.Title.Font.Size = 8
    .Axis.Title.Font.Color = vbWhite
    .Axis.Title.Caption = "Independent value"
    .Axis.Title.Angle = 90
    .Axis.Labels.Font.Size = 7
    .Axis.Labels.Font.Color = vbGreen
    .Axis.Increment = 20
    .RedLine.Visible = False
    .GreenLine.Visible = False
    .Face.Transparency = 100
    .Frame.Visible = False
  End With
End Sub

Private Sub DrawNGauge()
  xLeft = TChart1.Series(0).asCircularGauge.CircleXCenter - Round(TChart1.Series(0).asCircularGauge.XRadius * 2 / 3.75)
  xTop = TChart1.Series(0).asCircularGauge.CircleYCenter - (TChart1.Series(0).asCircularGauge.YRadius * 2) / 10
  xRight = TChart1.Series(0).asCircularGauge.CircleXCenter - (TChart1.Series(0).asCircularGauge.XRadius * 2) / 12
  xBottom = TChart1.Series(0).asCircularGauge.CircleYCenter + (TChart1.Series(0).asCircularGauge.YRadius * 2) / 10
  
  TChart1.Series(1).asNumericGauge.SetCustomBounds xLeft, xTop, xRight, xBottom
  TChart1.Series(1).asNumericGauge.Value = TChart1.Series(0).asCircularGauge.Value
End Sub

Private Sub DrawLGauge()
  TChart1.Series(2).asLinearGauge.SetCustomBounds TChart1.Series(0).asCircularGauge.CircleXCenter + (TChart1.Series(0).asCircularGauge.XRadius * 2) / 7, _
     TChart1.Series(0).asCircularGauge.CircleYCenter - (TChart1.Series(0).asCircularGauge.YRadius * 2) / 3, _
     TChart1.Series(0).asCircularGauge.CircleXCenter + (TChart1.Series(0).asCircularGauge.XRadius * 2) / 4, _
     TChart1.Series(0).asCircularGauge.CircleYCenter + (TChart1.Series(0).asCircularGauge.YRadius * 2) / 3
     
  TChart1.Series(2).asLinearGauge.Value = Rnd * 100
End Sub

Private Sub Timer1_Timer()
  If (TChart1.Series(0).asCircularGauge.Value >= 100) Then
    Increment = -0.1
  End If
  If (TChart1.Series(0).asCircularGauge.Value <= 0) Then
    Increment = 0.1
  End If

  TChart1.Series(0).asCircularGauge.Value = TChart1.Series(0).asCircularGauge.Value + Increment
End Sub
