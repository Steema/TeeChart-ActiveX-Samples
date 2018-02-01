VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Gradient_MultiColor 
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
      Caption         =   "Gradient"
      Height          =   345
      Left            =   240
      TabIndex        =   2
      Top             =   1170
      Width           =   1215
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11505
      Base64          =   $"Gradient_MultiColor.frx":0000
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Gradient_MultiColor.frx":14D0
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Gradient_MultiColor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Panel.Gradient.ShowEditor (False)
End Sub

Private Sub Form_Load()
With TChart1.Panel.Gradient
    .Visible = True
    .Colors.AddColor 0.3, vbBlue, 50
    .Colors.AddColor 0.6, vbGreen, 50
    .Colors.AddColor 0.8, vbYellow, 50
    .Direction = gdLeftRight
End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
