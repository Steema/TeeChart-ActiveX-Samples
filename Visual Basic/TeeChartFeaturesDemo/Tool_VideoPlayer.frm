VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2015.ocx"
Begin VB.Form Tool_VideoPlayer 
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
   Begin VB.CheckBox Check1 
      Caption         =   "Loop"
      Height          =   315
      Left            =   4920
      TabIndex        =   6
      Top             =   1170
      Value           =   1  'Checked
      Width           =   975
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Stop"
      Enabled         =   0   'False
      Height          =   345
      Left            =   3990
      TabIndex        =   5
      Top             =   1170
      Width           =   705
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Play"
      Height          =   345
      Left            =   3210
      TabIndex        =   4
      Top             =   1170
      Width           =   705
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   930
      TabIndex        =   2
      Text            =   "test.avi"
      Top             =   1200
      Width           =   2115
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   1620
      Width           =   11505
      Base64          =   $"Tool_VideoPlayer.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Tool_VideoPlayer.frx":05D6
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "File Name:"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   1230
      Width           =   750
   End
End
Attribute VB_Name = "Tool_VideoPlayer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Tools.Items(0).asVideoPlayer.Loop = Check1.Value
End Sub

Private Sub Command1_Click()
 If Dir$(Text2.Text, 0) <> "" Then
    TChart1.Tools.Items(0).asVideoPlayer.FileName = Text2.Text
    TChart1.Tools.Items(0).asVideoPlayer.Play
    Command1.Enabled = False
    Command2.Enabled = True
  Else
    MsgBox "File " + Text2.Text + " does not Exist." + Chr(13) + "You can create it by using the TVideoTool", , "File"
  End If
End Sub

Private Sub Command2_Click()
  TChart1.Tools.Items(0).asVideoPlayer.Stop
  Command1.Enabled = True
  Command2.Enabled = False
End Sub

Private Sub Form_Load()
  TChart1.Tools.Add tcVideoPlayer
  TChart1.Tools.Items(0).asVideoPlayer.FileName = Text2.Text
  TChart1.Tools.Items(0).asVideoPlayer.Loop = True
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
