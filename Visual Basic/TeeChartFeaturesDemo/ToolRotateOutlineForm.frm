VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ToolRotateOutlineForm 
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
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"ToolRotateOutlineForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Outline..."
      Height          =   345
      Left            =   2280
      TabIndex        =   3
      Top             =   1260
      Width           =   1095
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Draw outline"
      Height          =   195
      Left            =   585
      TabIndex        =   2
      Top             =   1320
      Value           =   1  'Checked
      Width           =   1455
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ToolRotateOutlineForm.frx":04D6
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ToolRotateOutlineForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Tools.Items(0).asRotate.Outline.ShowEditor
End Sub

Private Sub Check1_Click()
  TChart1.Tools.Items(0).asRotate.Outline.Visible = Check1 = 1
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 10
  ' Enable Rotate tool "Outline"
  TChart1.Tools.Items(0).asRotate.Outline.Visible = True
End Sub
