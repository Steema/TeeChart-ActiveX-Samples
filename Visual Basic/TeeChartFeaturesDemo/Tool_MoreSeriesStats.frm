VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_MoreSeriesStats 
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
   Begin VB.TextBox Text2 
      Height          =   5205
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   3
      Top             =   1710
      Width           =   3015
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Edit..."
      Height          =   405
      Left            =   210
      TabIndex        =   2
      Top             =   1260
      Width           =   1365
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5145
      Left            =   3030
      TabIndex        =   0
      Top             =   1740
      Width           =   8445
      Base64          =   $"Tool_MoreSeriesStats.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Tool_MoreSeriesStats.frx":16EE
      Top             =   0
      Width           =   11730
   End
End
Attribute VB_Name = "Tool_MoreSeriesStats"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Form_Load()
  With TChart1
    .Tools.Add tcSeriesStats
    .Tools.Items(0).asSeriesStats.Series = .Series(0)
    
    Text2.Text = .Tools.Items(0).asSeriesStats.Statistics.Text
    
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
