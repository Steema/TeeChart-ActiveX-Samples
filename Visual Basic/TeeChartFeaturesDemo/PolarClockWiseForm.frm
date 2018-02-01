VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form PolarClockWiseForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3210
   ClientTop       =   2565
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   765
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "PolarClockWiseForm.frx":0000
      Top             =   0
      Width           =   11490
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5745
      Left            =   0
      TabIndex        =   0
      Top             =   1170
      Width           =   11505
      Base64          =   $"PolarClockWiseForm.frx":0088
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Clockwise labels"
      Height          =   195
      Left            =   60
      TabIndex        =   1
      Top             =   870
      Value           =   1  'Checked
      Width           =   1815
   End
End
Attribute VB_Name = "PolarClockWiseForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Series(0).asPolar.ClockWiseLabels = Check1.Value
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 8
    .Series(0).asPolar.ClockWiseLabels = True
  End With
End Sub

Private Sub Label1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
