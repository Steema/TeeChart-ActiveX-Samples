VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ColorLine_DrawBehind3D 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3690
   ClientTop       =   1980
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5565
      Left            =   0
      TabIndex        =   1
      Top             =   1350
      Width           =   11505
      Base64          =   $"ColorLine_DrawBehind3D.frx":0000
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Draw 3D"
      Height          =   195
      Left            =   180
      TabIndex        =   3
      Top             =   1020
      Value           =   1  'Checked
      Width           =   1005
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Draw behind"
      Height          =   195
      Left            =   1620
      TabIndex        =   2
      Top             =   1020
      Width           =   1275
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "ColorLine_DrawBehind3D.frx":0344
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ColorLine_DrawBehind3D"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Tools.Items(0).asColorLine.DrawBehind = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Tools.Items(0).asColorLine.Draw3D = Check2.Value
End Sub

Private Sub Form_Load()
With TChart1
    .Series(0).FillSampleValues 20
    .Tools.Items(0).asColorLine.Value = .Series(0).YValues.Maximum - (.Series(0).YValues.Maximum * 0.2)
End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
