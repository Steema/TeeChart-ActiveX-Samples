VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Filter_Sharpen 
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
   Begin VB.CheckBox Check1 
      Caption         =   "Active"
      Height          =   240
      Left            =   225
      TabIndex        =   2
      Top             =   1035
      Value           =   1  'Checked
      Width           =   1410
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5475
      Left            =   0
      TabIndex        =   1
      Top             =   1440
      Width           =   11505
      Base64          =   $"Filter_Sharpen.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   945
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Filter_Sharpen.frx":153A
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Filter_Sharpen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
TChart1.Walls.Back.Picture.Filters.Item(0).Enabled = Check1.Value
TChart1.Repaint
End Sub

Private Sub Form_Load()
With TChart1
    .Walls.Back.Picture.Filters.Add fcSharpen
End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
