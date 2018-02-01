VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_Video 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3480
   ClientTop       =   3390
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   4200
      TabIndex        =   4
      Text            =   "test.avi"
      Top             =   1230
      Width           =   1965
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   6450
      Top             =   1770
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Stop recordering..."
      Enabled         =   0   'False
      Height          =   345
      Left            =   1590
      TabIndex        =   3
      Top             =   1170
      Width           =   1545
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Start recordering..."
      Height          =   345
      Left            =   60
      TabIndex        =   2
      Top             =   1170
      Width           =   1545
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5235
      Left            =   0
      TabIndex        =   1
      Top             =   1680
      Width           =   11505
      Base64          =   $"Tool_Video.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   30
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_Video.frx":0800
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "File Name:"
      Height          =   195
      Left            =   3360
      TabIndex        =   5
      Top             =   1260
      Width           =   750
   End
End
Attribute VB_Name = "Tool_Video"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Tools.Items(0).asVideo.StartRecording Text2.Text
  Timer1.Enabled = True
  Command1.Enabled = False
  Command2.Enabled = True
End Sub

Private Sub Command2_Click()
  Timer1.Enabled = False
  TChart1.Tools.Items(0).asVideo.StopRecording
  Command1.Enabled = True
  Command2.Enabled = False
End Sub

Private Sub Form_Load()
  TChart1.Tools.Add tcVideo
  
  TChart1.Series(0).FillSampleValues
End Sub

Private Sub Timer1_Timer()
  TChart1.Aspect.Rotation = (TChart1.Aspect.Rotation - 5) Mod 360
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
