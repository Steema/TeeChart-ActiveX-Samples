VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Title_Clear 
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
      Caption         =   "Clear"
      Height          =   345
      Left            =   5040
      TabIndex        =   4
      Top             =   1230
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Apply"
      Height          =   345
      Left            =   3840
      TabIndex        =   3
      Top             =   1230
      Width           =   1095
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1080
      TabIndex        =   2
      Text            =   "Text2"
      Top             =   1255
      Width           =   2775
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   1
      Top             =   1650
      Width           =   11505
      Base64          =   $"Title_Clear.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Title_Clear.frx":00D0
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Chart Title:"
      Height          =   195
      Left            =   240
      TabIndex        =   5
      Top             =   1300
      Width           =   765
   End
End
Attribute VB_Name = "Title_Clear"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Header.Caption = Text2.Text
End Sub

Private Sub Command2_Click()
  TChart1.Header.Clear
End Sub

Private Sub Form_Load()
  With TChart1.Header
    .Font.Gradient.StartColor = vbBlack
    .Font.Gradient.Visible = True
    .Font.Size = 22
    .Transparent = False
    .Bevel = bvLowered
    .Caption = "My Chart Title"
    Text2.Text = .Caption
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
