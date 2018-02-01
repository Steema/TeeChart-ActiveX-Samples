VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2013.ocx"
Begin VB.Form AxisCustomForm 
   BorderStyle     =   0  'None
   Caption         =   "AxisCustomForm"
   ClientHeight    =   6915
   ClientLeft      =   2340
   ClientTop       =   2220
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5955
      Left            =   0
      TabIndex        =   0
      Top             =   960
      Width           =   11505
      Base64          =   $"AxisCustomForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Custom axes visible"
      Height          =   195
      Left            =   270
      TabIndex        =   2
      Top             =   690
      Value           =   1  'Checked
      Width           =   1815
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   615
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "AxisCustomForm.frx":0A52
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "AxisCustomForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
Dim i
  With TChart1.Axis
    For i = 0 To .CustomCount - 1
      .Custom(i).Visible = Check1.Value
    Next i
  End With
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 15
    .Series(1).FillSampleValues 10
    .Series(2).FillSampleValues 18
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
