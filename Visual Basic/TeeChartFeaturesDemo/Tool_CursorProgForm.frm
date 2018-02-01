VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_CursorProgForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3090
   ClientTop       =   2325
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5895
      Left            =   0
      TabIndex        =   0
      Top             =   1020
      Width           =   11505
      Base64          =   $"Tool_CursorProgForm.frx":0000
   End
   Begin VB.CommandButton Command4 
      Caption         =   "v  Down"
      Height          =   345
      Left            =   4440
      TabIndex        =   5
      Top             =   600
      Width           =   1155
   End
   Begin VB.CommandButton Command3 
      Caption         =   "^  Up"
      Height          =   345
      Left            =   3180
      TabIndex        =   4
      Top             =   600
      Width           =   1155
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Right  >"
      Height          =   345
      Left            =   1500
      TabIndex        =   3
      Top             =   600
      Width           =   1155
   End
   Begin VB.CommandButton Command1 
      Caption         =   "<   Left"
      Height          =   345
      Left            =   240
      TabIndex        =   2
      Top             =   600
      Width           =   1155
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   495
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Tool_CursorProgForm.frx":0344
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Tool_CursorProgForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TChart1.Tools.Items(0).asTeeCursor.XVal = TChart1.Tools.Items(0).asTeeCursor.XVal - 1
End Sub

Private Sub Command2_Click()
  TChart1.Tools.Items(0).asTeeCursor.XVal = TChart1.Tools.Items(0).asTeeCursor.XVal + 1
End Sub

Private Sub Command3_Click()
  TChart1.Tools.Items(0).asTeeCursor.YVal = TChart1.Tools.Items(0).asTeeCursor.YVal + 10
End Sub

Private Sub Command4_Click()
  TChart1.Tools.Items(0).asTeeCursor.YVal = TChart1.Tools.Items(0).asTeeCursor.YVal - 10
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 20
End Sub
