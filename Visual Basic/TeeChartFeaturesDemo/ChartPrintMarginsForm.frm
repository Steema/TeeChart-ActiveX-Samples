VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartPrintMarginsForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2685
   ClientTop       =   1665
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command1 
      Caption         =   "Panel Options"
      Height          =   405
      Left            =   3000
      TabIndex        =   3
      Top             =   1290
      Width           =   2115
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5115
      Left            =   0
      TabIndex        =   2
      Top             =   1770
      Width           =   2985
      Base64          =   $"ChartPrintMarginsForm.frx":0000
   End
   Begin TeeChart.TeePreviewPanel TeePreviewPanel1 
      Height          =   5115
      Left            =   3000
      OleObjectBlob   =   "ChartPrintMarginsForm.frx":00B4
      TabIndex        =   0
      Top             =   1770
      Width           =   8460
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1215
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ChartPrintMarginsForm.frx":0105
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "ChartPrintMarginsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TeePreviewPanel1.ShowEditor
End Sub

Private Sub Form_Load()
  With TeePreviewPanel1
    .Chart = TChart1
    .Gradient.StartColor = RGB(128, 255, 255)
    .Gradient.EndColor = RGB(128, 255, 128)
    .Gradient.MidColor = vbBlack
    .Gradient.Visible = True
    .PaperColor = RGB(255, 255, 128)
  End With
End Sub
