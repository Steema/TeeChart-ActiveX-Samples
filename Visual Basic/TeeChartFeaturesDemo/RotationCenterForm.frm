VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form RotationCenterForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2895
   ClientTop       =   3195
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5445
      Left            =   0
      TabIndex        =   0
      Top             =   1470
      Width           =   11505
      Base64          =   $"RotationCenterForm.frx":0000
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Surface"
      Height          =   255
      Left            =   6000
      TabIndex        =   9
      Top             =   1080
      Value           =   1  'Checked
      Width           =   915
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Animate"
      Height          =   195
      Left            =   60
      TabIndex        =   8
      Top             =   1110
      Value           =   1  'Checked
      Width           =   1095
   End
   Begin VB.Timer Timer1 
      Interval        =   30
      Left            =   6600
      Top             =   1020
   End
   Begin VB.HScrollBar HScroll3 
      Height          =   255
      LargeChange     =   10
      Left            =   4740
      Max             =   100
      Min             =   -100
      SmallChange     =   5
      TabIndex        =   4
      Top             =   1080
      Width           =   1095
   End
   Begin VB.HScrollBar HScroll2 
      Height          =   255
      LargeChange     =   10
      Left            =   3180
      Max             =   100
      Min             =   -100
      SmallChange     =   5
      TabIndex        =   3
      Top             =   1080
      Width           =   1095
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "RotationCenterForm.frx":0758
      Top             =   0
      Width           =   11490
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      LargeChange     =   10
      Left            =   1500
      Max             =   200
      Min             =   -200
      SmallChange     =   5
      TabIndex        =   1
      Top             =   1080
      Width           =   1095
   End
   Begin VB.Label Label3 
      Caption         =   "Z:"
      Height          =   255
      Left            =   4560
      TabIndex        =   7
      Top             =   1080
      Width           =   195
   End
   Begin VB.Label Label2 
      Caption         =   "Y:"
      Height          =   255
      Left            =   2940
      TabIndex        =   6
      Top             =   1080
      Width           =   195
   End
   Begin VB.Label Label1 
      Caption         =   "X:"
      Height          =   255
      Left            =   1260
      TabIndex        =   5
      Top             =   1080
      Width           =   195
   End
End
Attribute VB_Name = "RotationCenterForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim Delta, DeltaE As Integer

Private Sub Check1_Click()
  Timer1.Enabled = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Series(0).Active = Check2.Value
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 20
  Delta = 1
  DeltaE = 1
  Timer1.Enabled = True
End Sub

Private Sub HScroll1_Change()
  HScroll1_Scroll
End Sub

Private Sub HScroll1_Scroll()
  TChart1.Canvas.RotationCenter.X = HScroll1.Value
End Sub
Private Sub HScroll2_Change()
  HScroll2_Scroll
End Sub
Private Sub HScroll2_Scroll()
  TChart1.Canvas.RotationCenter.Y = HScroll2.Value
End Sub
Private Sub HScroll3_Change()
  HScroll3_Scroll
End Sub
Private Sub HScroll3_Scroll()
  TChart1.Canvas.RotationCenter.z = HScroll3.Value
End Sub
Private Sub TChart1_OnAfterDraw()
  Dim tmpX, tmpY, tmpZ As Integer
If Check1.Value = 1 Then ' draw 3D axes
With TChart1
    ' set pen style
    .Canvas.Pen.Color = vbBlue
    .Canvas.Pen.Width = 1
    .Canvas.Pen.Style = psDot
    ' center position
    tmpY = .Canvas.ChartYCenter + CInt(.Canvas.RotationCenter.Y)
    tmpX = .Canvas.ChartXCenter + CInt(.Canvas.RotationCenter.X)
    tmpZ = (.Aspect.Width3D / 2) + CInt(.Canvas.RotationCenter.z)
    ' draw axes
    .Canvas.HorizLine3D .Axis.Left.Position, .Axis.Right.Position, tmpY, tmpZ
    .Canvas.VertLine3D tmpX, .Axis.Top.Position, .Axis.Bottom.Position, tmpZ
    .Canvas.ZLine3D tmpX, tmpY, 0, .Aspect.Width3D
End With
End If
End Sub
Private Sub Timer1_Timer()
With TChart1.Aspect
    .Rotation = .Rotation + Delta
    If .Rotation = 360 Then
      Delta = -1
    ElseIf .Rotation = 270 Then
      Delta = 1
    End If
      .Elevation = .Elevation + DeltaE
    If .Elevation = 360 Then
      DeltaE = -1
    ElseIf .Elevation = 300 Then
      DeltaE = 1
    End If
End With
End Sub
