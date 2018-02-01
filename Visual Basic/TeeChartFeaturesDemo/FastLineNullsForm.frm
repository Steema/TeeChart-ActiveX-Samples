VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form FastLineNullsForm 
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
      Height          =   5175
      Left            =   0
      TabIndex        =   1
      Top             =   1740
      Width           =   11505
      Base64          =   $"FastLineNullsForm.frx":0000
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Ignore Nulls"
      Height          =   195
      Left            =   4515
      TabIndex        =   4
      Top             =   1425
      Width           =   1935
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Inverted stairs"
      Height          =   195
      Left            =   2160
      TabIndex        =   3
      Top             =   1425
      Width           =   1455
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Stairs mode"
      Height          =   195
      Left            =   360
      TabIndex        =   0
      Top             =   1425
      Value           =   1  'Checked
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1335
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "FastLineNullsForm.frx":06F4
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "FastLineNullsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).asFastLine.Stairs = Check1.Value = 1

  ' enable / disable
  Check2.Enabled = TChart1.Series(0).asFastLine.Stairs
End Sub

Private Sub Check2_Click()
  TChart1.Series(0).asFastLine.InvertedStairs = Check2.Value = 1
End Sub

Private Sub Check3_Click()
  TChart1.Series(0).asFastLine.IgnoreNulls = Check3.Value = 1
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 50

  ' set some null points:
  TChart1.Series(0).SetNull 14
  TChart1.Series(0).SetNull 20
  TChart1.Series(0).SetNull 31
  TChart1.Series(0).SetNull 39

  ' allow nulls:
  ' (this property is False by default, for speed reasons)
  TChart1.Series(0).asFastLine.IgnoreNulls = False

  ' Draw in "stairs" mode:
  TChart1.Series(0).asFastLine.Stairs = True
End Sub
