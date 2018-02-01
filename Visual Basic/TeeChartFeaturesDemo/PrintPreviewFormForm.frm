VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form PrintPreviewFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Height          =   5145
      Left            =   0
      TabIndex        =   0
      Top             =   1740
      Width           =   6570
      Base64          =   $"PrintPreviewFormForm.frx":0000
   End
   Begin TeeChart.TeePreviewPanel TeePreviewPanel1 
      Height          =   5145
      Left            =   6570
      OleObjectBlob   =   "PrintPreviewFormForm.frx":03A6
      TabIndex        =   2
      Top             =   1740
      Width           =   4905
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit Chart"
      Height          =   345
      Left            =   300
      TabIndex        =   3
      Top             =   1260
      Width           =   1275
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "PrintPreviewFormForm.frx":03F7
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "PrintPreviewFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TChart1.ShowEditor
  TChart1.Repaint
End Sub

Private Sub Form_Load()
  With TeePreviewPanel1
    .Chart = TChart1
    .PaperColor = RGB(255, 255, 128)
    .Gradient.Visible = True
    .Gradient.StartColor = vbCyan
    .Gradient.EndColor = vbGreen
    .Gradient.MidColor = vbBlack
  End With
  TChart1.Printer.MarginLeft = 30
End Sub

Private Sub TChart1_OnAfterDraw()
  TeePreviewPanel1.Repaint
End Sub
