VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_CursorSnapStyle 
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
   Begin VB.CheckBox Check2 
      Caption         =   "Use Series Z"
      Height          =   195
      Left            =   5160
      TabIndex        =   5
      Top             =   1260
      Value           =   1  'Checked
      Width           =   1455
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Tool_CursorSnapStyle.frx":0000
      Left            =   2760
      List            =   "Tool_CursorSnapStyle.frx":000D
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1200
      Width           =   1455
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Snap"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1260
      Value           =   1  'Checked
      Width           =   855
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11505
      Base64          =   $"Tool_CursorSnapStyle.frx":0030
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_CursorSnapStyle.frx":08F8
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Snap Style:"
      Height          =   195
      Left            =   1800
      TabIndex        =   3
      Top             =   1245
      Width           =   810
   End
End
Attribute VB_Name = "Tool_CursorSnapStyle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Tools.Items(0).asTeeCursor.Snap = Check1.Value
  Combo1.Enabled = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Tools.Items(0).asTeeCursor.UseSeriesZ = Check2.Value
End Sub

Private Sub Combo1_Change()
  Combo1_Click
End Sub

Private Sub Combo1_Click()
  With TChart1.Tools.Items(0).asTeeCursor
    Select Case Combo1.ListIndex
      Case 0: .SnapStyle = ssDefault
      Case 1: .SnapStyle = ssHorizontal
      Case 2: .SnapStyle = ssVertical
    End Select
  End With
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 0
  TChart1.Tools.Items(0).asTeeCursor.UseSeriesZ = True
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
