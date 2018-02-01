VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Commander_FullRotation 
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
      OleObjectBlob   =   "Commander_FullRotation.frx":0000
      TabIndex        =   3
      Top             =   1410
      Width           =   11475
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Full rotation"
      Height          =   195
      Left            =   270
      TabIndex        =   2
      Top             =   1050
      Value           =   1  'Checked
      Width           =   1335
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4995
      Left            =   0
      TabIndex        =   1
      Top             =   1920
      Width           =   11505
      Base64          =   $"Commander_FullRotation.frx":004C
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Commander_FullRotation.frx":077A
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Commander_FullRotation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TeeCommander1.FullRotation = Check1.Value
End Sub

Private Sub Form_Load()
  With TeeCommander1
    .ChartLink = TChart1.ChartLink
    .FullRotation = True
    .DefaultButton = tcbRotate
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
