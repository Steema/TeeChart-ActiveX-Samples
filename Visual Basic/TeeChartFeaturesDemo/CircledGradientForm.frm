VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form CircledGradientForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2820
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   0
      Top             =   1590
      Width           =   11505
      Base64          =   $"CircledGradientForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit gradient..."
      Height          =   345
      Left            =   300
      TabIndex        =   2
      Top             =   1185
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "CircledGradientForm.frx":06CC
      Top             =   0
      Width           =   11235
   End
End
Attribute VB_Name = "CircledGradientForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Series(0).asPolar.CircleGradient.ShowEditor False
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 25
End Sub


Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
