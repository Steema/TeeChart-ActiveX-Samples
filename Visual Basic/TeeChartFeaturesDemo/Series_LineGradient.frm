VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_LineGradient 
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
   Begin VB.CommandButton Command2 
      Caption         =   "Gradient Line 1"
      Height          =   345
      Left            =   2070
      TabIndex        =   3
      Top             =   1170
      Width           =   1605
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Gradient Line 0"
      Height          =   345
      Left            =   210
      TabIndex        =   2
      Top             =   1170
      Width           =   1605
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11505
      Base64          =   $"Series_LineGradient.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Series_LineGradient.frx":090E
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Series_LineGradient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TChart1.Series(0).asLine.Gradient.ShowEditor False
End Sub

Private Sub Command2_Click()
  TChart1.Series(1).asLine.Gradient.ShowEditor False
End Sub

Private Sub Form_Load()
  With TChart1.Series(0).asLine.Gradient
    .EndColor = vbYellow
    .StartColor = TChart1.Series(0).Color
    .Visible = True
  End With

  With TChart1.Series(1).asLine.Gradient
    .EndColor = vbYellow
    .StartColor = TChart1.Series(1).Color
    .Visible = True
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
