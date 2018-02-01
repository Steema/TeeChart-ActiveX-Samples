VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form PolarZonesForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2820
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   0
      Top             =   1620
      Width           =   11505
      Base64          =   $"PolarZonesForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Draw Zones"
      Height          =   255
      Left            =   720
      TabIndex        =   2
      Top             =   1230
      Value           =   1  'Checked
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "PolarZonesForm.frx":06AA
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "PolarZonesForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FirstTime As Boolean

Private Sub DrawPolarZones()
  If TChart1.Series(0).asPolar.XCenter <> 0 Then
    ' Hide pen
    TChart1.Canvas.Pen.Style = psClear

    ' Draw three zones (green, yellow and red)

    TChart1.Canvas.Brush.Color = vbGreen
    TChart1.Series(0).asPolar.DrawZone 0, 100, TChart1.Width

    TChart1.Canvas.Brush.Color = vbYellow
    TChart1.Series(0).asPolar.DrawZone 100, 300, TChart1.Width

    TChart1.Canvas.Brush.Color = vbRed
    TChart1.Series(0).asPolar.DrawZone 300, 700, TChart1.Width

    ' Prepare Pen

    With TChart1.Canvas.Pen
      .Color = vbWhite
      .Width = 2
      .Style = psSolid
    End With

    ' Draw "ring" at 300

    TChart1.Series(0).asPolar.DrawRing 300, TChart1.Width
  End If
End Sub

Private Sub Check1_Click()
  TChart1.Repaint
End Sub

Private Sub Form_Activate()
  If FirstTime Then
    TChart1.Repaint
    FirstTime = False
  End If
End Sub

Private Sub Form_Load()
  FirstTime = True
  TChart1.Series(0).Clear
  TChart1.Series(0).asPolar.AddPolar 30, 100, "", clTeeColor
  TChart1.Series(0).asPolar.AddPolar 45, 150, "", clTeeColor
  TChart1.Series(0).asPolar.AddPolar 60, -90, "", clTeeColor
  TChart1.Series(0).asPolar.AddPolar 80, 300, "", clTeeColor
  TChart1.Series(0).asPolar.AddPolar 130, 400, "", clTeeColor
  TChart1.Series(0).asPolar.AddPolar 170, 250, "", clTeeColor
  TChart1.Series(0).asPolar.AddPolar 230, 100, "", clTeeColor
  TChart1.Series(0).asPolar.AddPolar 260, 120, "", clTeeColor
  TChart1.Series(0).asPolar.AddPolar 330, 700, "", clTeeColor
End Sub

Private Sub TChart1_OnSeriesBeforeDrawValues(ByVal SeriesIndex As Long)
  If Check1.Value = 1 Then DrawPolarZones
End Sub
