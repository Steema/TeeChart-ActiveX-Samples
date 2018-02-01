VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_MarksTipCancelHint 
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
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   1
      Top             =   1710
      Width           =   11505
      Base64          =   $"Tool_MarksTipCancelHint.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1275
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_MarksTipCancelHint.frx":049A
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Cancelled Hint:"
      Height          =   195
      Left            =   360
      TabIndex        =   2
      Top             =   1380
      Width           =   1080
   End
End
Attribute VB_Name = "Tool_MarksTipCancelHint"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim HintText As String

Private Sub TChart1_OnMarkTipToolCancelHint()
  Label1.Caption = "Cancelled Hint: " + HintText
End Sub

Private Sub TChart1_OnMarkTipToolGetText(ByVal Tool As Long, Text As String)
  HintText = Text
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
