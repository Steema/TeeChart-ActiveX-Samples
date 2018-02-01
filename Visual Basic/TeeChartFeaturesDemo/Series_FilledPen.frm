VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_FilledPen 
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.CheckBox cbFill 
      BackColor       =   &H80000005&
      Caption         =   "&Fill gradient visible"
      Height          =   255
      Left            =   150
      TabIndex        =   2
      Top             =   1320
      Value           =   1  'Checked
      Width           =   2460
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5190
      Left            =   0
      TabIndex        =   0
      Top             =   1725
      Width           =   11505
      Base64          =   $"Series_FilledPen.frx":0000
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   1080
      Left            =   90
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Series_FilledPen.frx":19AC
      Top             =   120
      Width           =   11340
   End
End
Attribute VB_Name = "Series_FilledPen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cbFill_Click()
  TChart1.Series(0).Pen.Fill.Gradient.Visible = cbFill.Value
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues (5)
  TChart1.Series(0).Pen.Width = 10
  TChart1.Series(0).Pen.Fill.Gradient.Visible = True
  TChart1.Series(0).Pen.Fill.Gradient.StartColor = vbRed
  TChart1.Series(0).Pen.Fill.Gradient.EndColor = vbGreen
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

