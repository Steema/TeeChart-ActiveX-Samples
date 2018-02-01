VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "TeeChart Pro Date & Time format options"
   ClientHeight    =   5835
   ClientLeft      =   1725
   ClientTop       =   3165
   ClientWidth     =   8220
   LinkTopic       =   "Form2"
   ScaleHeight     =   5835
   ScaleWidth      =   8220
   Begin VB.CommandButton Command1 
      Caption         =   "&Close"
      Height          =   435
      Left            =   6720
      TabIndex        =   1
      Top             =   5340
      Width           =   1395
   End
   Begin VB.TextBox Text1 
      Height          =   5175
      Left            =   60
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Form2.frx":0000
      Top             =   60
      Width           =   8055
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  Form2.Hide
End Sub




