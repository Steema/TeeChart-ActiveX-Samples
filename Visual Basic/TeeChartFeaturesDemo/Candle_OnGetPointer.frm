VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Candle_OnGetPointer 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3600
   ClientTop       =   2775
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5595
      Left            =   0
      TabIndex        =   0
      Top             =   1320
      Width           =   11505
      Base64          =   $"Candle_OnGetPointer.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Use event to Change border colours"
      Height          =   195
      Left            =   330
      TabIndex        =   2
      Top             =   1020
      Value           =   1  'Checked
      Width           =   3735
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Candle_OnGetPointer.frx":0742
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "Candle_OnGetPointer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
 TChart1.Repaint
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 20
End Sub

Private Sub TChart1_OnGetSeriesPointerStyle(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, AStyle As TeeChart.EPointerStyle)
 With TChart1
  If Check1.Value = 1 Then
    ' change some candle colors...
    If ValueIndex Mod 2 = 0 Then
      AStyle = psRectangle
      .Series(0).asCandle.Pointer.Pen.Color = vbYellow
    Else
      AStyle = psDiamond
      .Series(0).asCandle.Pointer.Pen.Color = vbBlue
    End If
  Else
    AStyle = psRectangle ' default
    .Series(0).asCandle.Pointer.Pen.Color = vbBlack
  End If
 End With
End Sub
