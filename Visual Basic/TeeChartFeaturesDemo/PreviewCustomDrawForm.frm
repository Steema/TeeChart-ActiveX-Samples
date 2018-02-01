VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form PreviewCustomDrawForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2820
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Height          =   5205
      Left            =   4650
      TabIndex        =   0
      Top             =   1680
      Width           =   6825
      Base64          =   $"PreviewCustomDrawForm.frx":0000
   End
   Begin TeeChart.TeePreviewPanel TeePreviewPanel1 
      Height          =   5205
      Left            =   0
      OleObjectBlob   =   "PreviewCustomDrawForm.frx":0696
      TabIndex        =   2
      Top             =   1680
      Width           =   4605
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Custom draw on paper"
      Height          =   255
      Left            =   450
      TabIndex        =   3
      Top             =   1290
      Value           =   1  'Checked
      Width           =   2295
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "PreviewCustomDrawForm.frx":06E6
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "PreviewCustomDrawForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TeePreviewPanel1.Repaint
End Sub

Private Sub Form_Load()
  TeePreviewPanel1.Chart = TChart1
End Sub

Private Sub TeePreviewPanel1_OnAfterDraw()
  If Check1.Value = 1 Then
    With TeePreviewPanel1.Canvas
      .Font.Color = vbRed
      .Font.Size = 12
      .TextOut TeePreviewPanel1.PaperRect.Left + 10, _
               TeePreviewPanel1.PaperRect.Top + 6, _
               "Some text"
    End With
  End If
End Sub

