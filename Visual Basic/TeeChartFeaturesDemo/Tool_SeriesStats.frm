VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_SeriesStats 
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
      Height          =   5685
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   3
      Text            =   "Tool_SeriesStats.frx":0000
      Top             =   1200
      Width           =   2595
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   240
      TabIndex        =   2
      Top             =   750
      Width           =   1005
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5685
      Left            =   2610
      TabIndex        =   1
      Top             =   1200
      Width           =   8865
      Base64          =   $"Tool_SeriesStats.frx":0006
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   645
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_SeriesStats.frx":091C
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Tool_SeriesStats"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
  Text2.Text = TChart1.Tools.Items(0).asSeriesStats.Statistics.Text
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
