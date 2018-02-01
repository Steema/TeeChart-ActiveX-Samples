VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_SubChart 
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
   Begin TeeChart.TeeCommander TeeCommander2 
      Height          =   5625
      Left            =   10980
      OleObjectBlob   =   "Tool_SubChart.frx":0000
      TabIndex        =   3
      Top             =   1260
      Width           =   465
   End
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   465
      Left            =   0
      OleObjectBlob   =   "Tool_SubChart.frx":0057
      TabIndex        =   2
      Top             =   810
      Width           =   11475
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5625
      Left            =   0
      TabIndex        =   1
      Top             =   1260
      Width           =   10770
      Base64          =   $"Tool_SubChart.frx":00A3
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   795
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_SubChart.frx":102F
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Tool_SubChart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  TeeCommander1.Chart = TChart1
'  TeeCommander2.Chart = TChart2
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
