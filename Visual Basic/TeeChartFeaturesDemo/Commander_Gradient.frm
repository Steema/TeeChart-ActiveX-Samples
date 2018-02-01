VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Commander_Gradient 
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
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   495
      Left            =   0
      OleObjectBlob   =   "Commander_Gradient.frx":0000
      TabIndex        =   3
      Top             =   930
      Width           =   11475
   End
   Begin VB.CommandButton Command1 
      Caption         =   "TeeCommander Gradient..."
      Height          =   345
      Left            =   360
      TabIndex        =   2
      Top             =   1530
      Width           =   2775
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4965
      Left            =   0
      TabIndex        =   1
      Top             =   1950
      Width           =   11505
      Base64          =   $"Commander_Gradient.frx":004C
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Commander_Gradient.frx":0848
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "Commander_Gradient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TeeCommander1.Gradient.ShowEditor False
End Sub

Private Sub Form_Load()
  TeeCommander1.ChartLink = TChart1.ChartLink
  
  With TeeCommander1.Gradient
    .StartColor = vbWhite
    .EndColor = vbGrayText
    .MidColor = RGB(255, 255, 128)
    .Visible = True
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
