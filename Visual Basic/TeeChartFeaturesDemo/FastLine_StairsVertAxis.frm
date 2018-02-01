VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form FastLine_StairsVertAxis 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   4095
   ClientTop       =   1980
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5625
      Left            =   0
      TabIndex        =   4
      Top             =   1290
      Width           =   11505
      Base64          =   $"FastLine_StairsVertAxis.frx":0000
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Inverted Staired"
      Height          =   195
      Left            =   5400
      TabIndex        =   1
      Top             =   1020
      Width           =   1575
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Staired "
      Height          =   195
      Left            =   4080
      TabIndex        =   3
      Top             =   1020
      Width           =   1215
   End
   Begin VB.CheckBox Check1 
      Caption         =   "AutoScale Vertical Axis"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   1020
      Width           =   2055
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "FastLine_StairsVertAxis.frx":00B8
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "FastLine_StairsVertAxis"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
With TChart1
    .Series(0).asFastLine.AutoSizeVertAxis = Check1.Value
    If .Series(0).asFastLine.AutoSizeVertAxis = False Then
        .Axis.Left.SetMinMax 30, 70
    End If
End With
End Sub

Private Sub Check2_Click()
With TChart1
    .Series(0).asFastLine.Stairs = Check2.Value
    If .Series(0).asFastLine.Stairs = True Then
        Check3.Enabled = True
    Else
        Check3.Enabled = False
        Check3.Value = 0
    End If
End With
End Sub

Private Sub Check3_Click()
With TChart1
    .Series(0).asFastLine.InvertedStairs = Check3.Value
End With
End Sub

Private Sub Form_Load()
Check3.Enabled = False
With TChart1
    .TimerEnabled = True
    .TimerInterval = 1000
    .Aspect.View3D = False
    .AddSeries scFastLine
    .Series(0).XValues.DateTime = True
    .Series(0).asFastLine.AddRealTime Now, Rnd * 100
    .Series(0).asFastLine.AutoSizeVertAxis = False
    .Axis.Left.SetMinMax 30, 70
    .Axis.Bottom.Labels.DateTimeFormat = "hh:mm:ss"
    .Axis.Bottom.SetMinMax Now - 6 / 86400, Now + 4 / 86400
End With
End Sub

Private Sub TChart1_OnTimer()
With TChart1
    .Series(0).asFastLine.AddRealTime Now, Rnd * 100
    .Axis.Bottom.SetMinMax Now - 6 / 86400, Now + 4 / 86400
End With
End Sub

