VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ColorGridMarksForm 
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
      Height          =   5295
      Left            =   0
      TabIndex        =   0
      Top             =   1620
      Width           =   11505
      Base64          =   $"ColorGridMarksForm.frx":0000
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Centered mode"
      Height          =   195
      Left            =   3885
      TabIndex        =   4
      Top             =   1290
      Value           =   1  'Checked
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit Marks..."
      Height          =   345
      Left            =   2040
      TabIndex        =   3
      Top             =   1215
      Width           =   1575
   End
   Begin VB.CheckBox Check1 
      Caption         =   "View Marks"
      Height          =   195
      Left            =   480
      TabIndex        =   2
      Top             =   1290
      Value           =   1  'Checked
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ColorGridMarksForm.frx":02D2
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ColorGridMarksForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
  TChart1.Series(0).Marks.ShowEditorMarks
  Check1.Value = IIf(TChart1.Series(0).Marks.Visible, 1, 0)
End Sub

Private Sub Check1_Click()
  TChart1.Series(0).Marks.Visible = (Check1.Value = 1)
End Sub

Private Sub Check2_Click()
  TChart1.Series(0).asColorGrid.CenteredPoints = (Check2.Value = 1)
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 5
  TChart1.Series(0).asColorGrid.CenteredPoints = True
  TChart1.Series(0).Marks.Style = smsValue
  TChart1.Series(0).Marks.Visible = True
  TChart1.Series(0).Marks.Shadow.Transparency = 70
End Sub
