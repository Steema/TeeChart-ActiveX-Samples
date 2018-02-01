VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form BoxPlotFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2445
   ClientTop       =   2280
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5565
      Left            =   0
      TabIndex        =   0
      Top             =   1350
      Width           =   11505
      Base64          =   $"BoxPlotFormForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Vertical"
      Height          =   195
      Left            =   660
      TabIndex        =   2
      Top             =   1020
      Value           =   1  'Checked
      Width           =   1275
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "BoxPlotFormForm.frx":0CA6
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "BoxPlotFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  If Check1.Value = 1 Then
    For i = 0 To TChart1.SeriesCount - 1
      TChart1.ChangeSeriesType i, scBox
    Next i
  Else
    For i = 0 To TChart1.SeriesCount - 1
      TChart1.ChangeSeriesType i, scHorizBox
    Next i
  End If
End Sub

Private Sub Form_Load()
Dim a
  a = Array(3, 6, 8, 15, 19, 21)
  With TChart1
    .Series(0).AddArray UBound(a) + 1, a
    .Series(1).AddArray UBound(a) + 1, a
    .Series(2).AddArray UBound(a) + 1, a
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
