VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Gradient_SubGradient 
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
      Caption         =   "SubGradient"
      Height          =   345
      Left            =   1680
      TabIndex        =   6
      Top             =   1170
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Gradient"
      Height          =   345
      Left            =   240
      TabIndex        =   5
      Top             =   1170
      Width           =   1215
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   4920
      Max             =   100
      TabIndex        =   2
      Top             =   1250
      Value           =   50
      Width           =   1695
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11505
      Base64          =   $"Gradient_SubGradient.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Gradient_SubGradient.frx":0882
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "50"
      Height          =   195
      Left            =   6720
      TabIndex        =   4
      Top             =   1255
      Width           =   180
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Transparency:"
      Height          =   195
      Left            =   3840
      TabIndex        =   3
      Top             =   1260
      Width           =   1020
   End
End
Attribute VB_Name = "Gradient_SubGradient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Panel.Gradient.ShowEditor (False)
End Sub

Private Sub Command2_Click()
  TChart1.Panel.Gradient.SubGradient.ShowEditor (False)
End Sub

Private Sub Form_Load()
  With TChart1.Panel.Gradient.SubGradient
    .StartColor = vbYellow
    .EndColor = vbRed
    .Visible = True
    .Direction = gdFromCenter
    .Transparency = 50
  End With
End Sub

Private Sub HScroll1_Change()
  TChart1.Panel.Gradient.SubGradient.Transparency = HScroll1.Value
  Label2.Caption = Str(HScroll1.Value)
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
