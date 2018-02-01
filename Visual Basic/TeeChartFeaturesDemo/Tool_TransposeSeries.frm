VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_TransposeSeries 
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
   Begin VB.CommandButton Command1 
      Caption         =   "Transpose"
      Height          =   345
      Left            =   150
      TabIndex        =   2
      Top             =   900
      Width           =   1095
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5625
      Left            =   0
      TabIndex        =   1
      Top             =   1290
      Width           =   11505
      Base64          =   $"Tool_TransposeSeries.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   795
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_TransposeSeries.frx":07AA
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Tool_TransposeSeries"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Tools.Items(0).asTransposeSeries.Transpose
End Sub

Private Sub Form_Load()
  TChart1.Series(0).asBar.MultiBar = mbNone
  TChart1.Series(2).SetNull 5
  TChart1.Series(2).Delete 5
  
  TChart1.Tools.Add tcTransposeSeries
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
