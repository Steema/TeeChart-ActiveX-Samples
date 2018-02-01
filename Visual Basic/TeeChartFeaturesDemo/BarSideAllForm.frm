VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form BarSideAllForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3495
   ClientTop       =   2295
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5385
      Left            =   0
      TabIndex        =   0
      Top             =   1530
      Width           =   11505
      Base64          =   $"BarSideAllForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   3
      Text            =   "BarSideAllForm.frx":0804
      Top             =   0
      Width           =   11460
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Side to Side"
      Height          =   195
      Index           =   1
      Left            =   1710
      TabIndex        =   2
      Top             =   1200
      Width           =   1155
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Side all"
      Height          =   195
      Index           =   0
      Left            =   330
      TabIndex        =   1
      Top             =   1200
      Value           =   -1  'True
      Width           =   1155
   End
End
Attribute VB_Name = "BarSideAllForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 4
    .Series(1).FillSampleValues 4
    .Series(0).asBar.MultiBar = mbSideAll
  End With
End Sub

Private Sub Option1_Click(Index As Integer)
  If Index = 0 Then
    TChart1.Series(0).asBar.MultiBar = mbSideAll
  Else
    TChart1.Series(0).asBar.MultiBar = mbSide
  End If
End Sub
