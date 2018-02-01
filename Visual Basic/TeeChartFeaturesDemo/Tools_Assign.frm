VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tools_Assign 
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
   Begin VB.CommandButton Command3 
      Caption         =   "Assign all Tools"
      Height          =   345
      Left            =   60
      TabIndex        =   5
      Top             =   3150
      Width           =   1815
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Edit Tools Chart2..."
      Height          =   345
      Left            =   3780
      TabIndex        =   4
      Top             =   3150
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit Tools Chart1..."
      Height          =   345
      Left            =   1920
      TabIndex        =   3
      Top             =   3150
      Width           =   1815
   End
   Begin TeeChart.TChart TChart2 
      Align           =   2  'Align Bottom
      Height          =   3315
      Left            =   0
      TabIndex        =   2
      Top             =   3600
      Width           =   11505
      Base64          =   $"Tools_Assign.frx":0000
   End
   Begin TeeChart.TChart TChart1 
      Height          =   1935
      Left            =   0
      TabIndex        =   1
      Top             =   1110
      Width           =   11475
      Base64          =   $"Tools_Assign.frx":0450
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Tools_Assign.frx":074E
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Tools_Assign"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Tools.Items(0).ShowEditor
End Sub

Private Sub Command2_Click()
  TChart2.Tools.Items(0).ShowEditor
End Sub

Private Sub Command3_Click()
Dim i As Integer
  For i = 0 To TChart2.Tools.Count - 1
'    TChart2.Tools.Items(i).Assign TChart1.Tools.Items(i)
  Next i
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
