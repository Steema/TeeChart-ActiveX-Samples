VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ContourOnBeforeDrawForm 
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
      Height          =   5355
      Left            =   0
      TabIndex        =   0
      Top             =   1560
      Width           =   11505
      Base64          =   $"ContourOnBeforeDrawForm.frx":0000
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   270
      Left            =   2550
      Max             =   1
      Min             =   9
      TabIndex        =   3
      Top             =   1200
      Value           =   6
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1995
      TabIndex        =   2
      Text            =   "6"
      Top             =   1185
      Width           =   570
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ContourOnBeforeDrawForm.frx":065C
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Change pen for level:"
      Height          =   195
      Left            =   360
      TabIndex        =   4
      Top             =   1230
      Width           =   1515
   End
End
Attribute VB_Name = "ContourOnBeforeDrawForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 10
End Sub

Private Sub TChart1_OnSeriesContourBeforeDrawLevel(ByVal SeriesIndex As Long, ByVal LevelIndex As Long)
  ' Change pen for selected contour level...
  If LevelIndex = VScroll1.Value Then
     TChart1.Canvas.Pen.Width = 3
  Else
     TChart1.Canvas.Pen.Width = 1
  End If
End Sub

Private Sub Text2_Change()
Dim v As Integer
  v = val(Text2.Text)
  If Not IsNumeric(Text2.Text) Or v < 1 Or v > 9 Then
    KeepFocus = True
    MsgBox "Please insert a numeric value between 1 and 9", , "Contour level"
  Else
    TChart1.Repaint
    If VScroll1.Value <> v Then VScroll1.Value = v
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
Dim s As String
  s = LTrim$(Str$(VScroll1.Value))
  If Text2.Text <> s Then Text2.Text = s
End Sub
