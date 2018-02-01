VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form LegendFontColorForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3630
   ClientTop       =   3150
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   0
      Top             =   1590
      Width           =   11505
      Base64          =   $"LegendFontColorForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1215
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   3
      Text            =   "LegendFontColorForm.frx":043E
      Top             =   0
      Width           =   11490
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Multiple Series"
      Height          =   195
      Left            =   3540
      TabIndex        =   2
      Top             =   1290
      Width           =   2895
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Legend Font Series colours"
      Height          =   195
      Left            =   0
      TabIndex        =   1
      Top             =   1290
      Value           =   1  'Checked
      Width           =   2775
   End
End
Attribute VB_Name = "LegendFontColorForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Legend.FontSeriesColor = Check1.Value
End Sub

Private Sub Check2_Click()
  With TChart1
    .Repaint
    .Series(1).Active = Check2.Value
    .Series(2).Active = Check2.Value
    If Check2.Value = 1 Then
      .Series(0).ColorEachPoint = False
    Else
      .Series(0).ColorEachPoint = True
    End If
  End With
End Sub

Private Sub Form_Load()
  With TChart1
    .AddSeries scBar
    .AddSeries scPoint
    .AddSeries scLine
    .Series(0).FillSampleValues 10
    .Series(1).FillSampleValues 10
    .Series(1).asPoint.Pointer.Style = psDownTriangle
    .Series(2).FillSampleValues 10
    .Series(0).ColorEachPoint = True
    .Series(1).Active = False
    .Series(2).Active = False
    .Legend.Font.Size = 14
    .Legend.Font.Shadow.Color = vbWhite
    .Legend.Font.Shadow.HorizSize = 1
    .Legend.Font.Shadow.VertSize = 1
    .Legend.FontSeriesColor = Check1.Value
  End With
End Sub
