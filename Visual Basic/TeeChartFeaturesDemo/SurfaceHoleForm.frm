VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SurfaceHoleForm 
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
      Height          =   5790
      Left            =   0
      TabIndex        =   0
      Top             =   1125
      Width           =   11505
      Base64          =   $"SurfaceHoleForm.frx":0000
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   10
         Left            =   1800
         Top             =   1710
      End
   End
   Begin TeeChart.TeeCommander TeeCommander1 
      Align           =   1  'Align Top
      Height          =   510
      Left            =   0
      OleObjectBlob   =   "SurfaceHoleForm.frx":3B2C
      TabIndex        =   3
      Top             =   0
      Width           =   11505
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Back Wall"
      Height          =   195
      Left            =   4770
      TabIndex        =   5
      Top             =   750
      Width           =   1410
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Animate"
      Height          =   195
      Left            =   3240
      TabIndex        =   4
      Top             =   750
      Width           =   1410
   End
   Begin VB.CommandButton Command2 
      Caption         =   "With Hole"
      Height          =   345
      Left            =   1575
      TabIndex        =   2
      Top             =   690
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Normal"
      Height          =   345
      Left            =   45
      TabIndex        =   1
      Top             =   690
      Width           =   1515
   End
End
Attribute VB_Name = "SurfaceHoleForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Angle, Delta3D, Pi As Double

Private Sub Check1_Click()
  Timer1.Enabled = Check1.Value
End Sub

Private Sub Check2_Click()
  If Check2.Value Then
    TChart1.Walls.Back.Transparent = False
  Else
    TChart1.Walls.Back.Transparent = True
  End If
End Sub

Private Sub Command1_Click()
  With TChart1
    .Series(0).Clear
    For X = 1 To 10
        For z = 1 To 10
            tmp = Cos(X / 10#) * Sin(z / 10#)
            .Series(0).asSurface.AddXYZ X, tmp, z, "", clTeeColor
        Next z
    Next X
  End With
End Sub

Private Sub Command2_Click()
Dim X, z As Integer
Dim tmp As Double
With TChart1
  .Series(0).Clear
  For X = 1 To 10
    For z = 1 To 10
          tmp = Cos(X / 10#) * Sin(z / 10#)
      ' apply hole at cells (5,5) to (6,6)
      If ((X = 5) Or (X = 6)) And ((z = 5) Or (z = 6)) Then
         .Series(0).asSurface.AddXYZ X, tmp, z, "", clNone   ' { <-- NULL cell }
      Else
         .Series(0).asSurface.AddXYZ X, tmp, z, "", clTeeColor
      End If
    Next
  Next
End With
End Sub

Private Sub Form_Load()
TeeCommander1.Chart = TChart1
Angle = 0
Delta3D = 1
Pi = 4 * Atn(1)
With TChart1
  .AddSeries scSurface
  .Series(0).asSurface.NumXValues = 10
  .Series(0).asSurface.NumZValues = 10
  .Axis.Left.Increment = 0.1
  .Axis.Bottom.Increment = 1
  .Axis.Bottom.Labels.Separation = 0
  Command2_Click
End With
End Sub

Private Sub Timer1_Timer()
Dim tmpY, tmpX As Double
  Angle = Angle + 5
  If Angle > 359 Then Angle = 0
  With TChart1
    .Aspect.Chart3DPercent = .Aspect.Chart3DPercent + Delta3D
    If (.Aspect.Chart3DPercent < 5) Or (.Aspect.Chart3DPercent > 60) Then Delta3D = -Delta3D
    With .Series(0).XValues
      tmpX = Sin(Angle * Pi / 180#)
      TChart1.Axis.Bottom.SetMinMax .Minimum - tmpX, .Maximum - tmpX
    End With
    With .Series(0).YValues
      tmpY = Cos(Angle * Pi / 180#) * ((.Maximum - .Minimum) / 10#)
      TChart1.Axis.Left.SetMinMax .Minimum - tmpY, .Maximum - tmpY
    End With
  End With
End Sub
