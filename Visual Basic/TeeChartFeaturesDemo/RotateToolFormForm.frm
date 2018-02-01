VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form RotateToolFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2955
   ClientTop       =   2730
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5865
      Left            =   0
      TabIndex        =   0
      Top             =   1050
      Width           =   11505
      Base64          =   $"RotateToolFormForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Active"
      Height          =   195
      Left            =   180
      TabIndex        =   2
      Top             =   720
      Value           =   1  'Checked
      Width           =   1275
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   615
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "RotateToolFormForm.frx":0704
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "RotateToolFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Tools(0).asRotate.Active = Check1.Value
End Sub

Private Sub Form_Load()
TChart1.Series(0).FillSampleValues 50
End Sub

Private Sub Text1_DblClick()
 TChart1.ShowEditor
End Sub
