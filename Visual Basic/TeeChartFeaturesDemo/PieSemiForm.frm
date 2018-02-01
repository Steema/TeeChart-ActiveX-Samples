VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2013.ocx"
Begin VB.Form PieSemiForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2925
   ClientTop       =   4125
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5385
      Left            =   0
      TabIndex        =   0
      Top             =   1530
      Width           =   11505
      Base64          =   $"PieSemiForm.frx":0000
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Vertical"
      Height          =   195
      Left            =   2760
      TabIndex        =   3
      Top             =   1200
      Value           =   1  'Checked
      Width           =   2415
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Semi-Pie"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1200
      Value           =   1  'Checked
      Width           =   2295
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Label1"
      Height          =   1095
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "PieSemiForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  With TChart1
    If Check1.Value = 1 Then
      .Series(0).asPie.AngleSize = 180
    Else
      .Series(0).asPie.AngleSize = 360
    End If
  End With
End Sub

Private Sub Check2_Click()
  With TChart1
    If Check2.Value = 1 Then
      .Series(0).asPie.RotationAngle = 90
    Else
      .Series(0).asPie.RotationAngle = 0
    End If
  End With
End Sub

Private Sub Form_Load()
  Label1.Caption = "The new AngleSize property, used with RotationAngle, can display " _
  & "horizontal or vertical partial pie series." & Chr(13) _
  & Chr(13) _
  & "Example: TChart1.Series(0).asPie.AngleSize = 180 " & Chr(13) _
  & "         TChart1.Series(0).asPie.RotationAngle=90 "
  With TChart1
    .Series(0).FillSampleValues 5
    .Series(0).asPie.AngleSize = 180
    .Series(0).asPie.RotationAngle = 90
  End With
End Sub
