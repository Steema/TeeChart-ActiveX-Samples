VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ContourSmoothSegmentsForm 
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
      Height          =   5115
      Left            =   0
      TabIndex        =   1
      Top             =   1800
      Width           =   11505
      Base64          =   $"ContourSmoothSegmentsForm.frx":0000
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Draw segment points"
      Height          =   195
      Left            =   4575
      TabIndex        =   7
      Top             =   1425
      Width           =   1935
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Interpolate"
      Enabled         =   0   'False
      Height          =   195
      Left            =   1680
      TabIndex        =   6
      Top             =   1425
      Width           =   1095
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Smooth lines"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   1425
      Width           =   1335
   End
   Begin VB.VScrollBar VScroll1 
      Enabled         =   0   'False
      Height          =   270
      Left            =   4110
      Max             =   0
      Min             =   100
      TabIndex        =   4
      Top             =   1410
      Value           =   4
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Enabled         =   0   'False
      Height          =   285
      Left            =   3555
      TabIndex        =   3
      Text            =   "4"
      Top             =   1395
      Width           =   570
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1335
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "ContourSmoothSegmentsForm.frx":069A
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Value:"
      Height          =   195
      Left            =   3000
      TabIndex        =   5
      Top             =   1440
      Width           =   450
   End
End
Attribute VB_Name = "ContourSmoothSegmentsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(0).asContour.Smoothing.Active = Check1.Value = 1
  
  Check2.Enabled = Check1.Value = 1
  VScroll1.Enabled = Check1.Value = 1
  Text2.Enabled = Check1.Value = 1
End Sub

Private Sub Check2_Click()
  TChart1.Series(0).asContour.Smoothing.Interpolate = Check2.Value = 1
End Sub

Private Sub Check3_Click()
  TChart1.Repaint
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 5
End Sub

Private Sub TChart1_OnAfterDraw()
Dim tmpLevel As Integer, tmpSegment As Integer, tmp As Integer
Dim X As Double, Y As Double
  If Check3.Value = 1 Then
    ' Draw small points at contour level segment lines...
    TChart1.Canvas.Brush.Color = vbBlack
    TChart1.Canvas.Pen.Color = RGB(0, 127, 0)

    With TChart1.Series(0).asContour
        For tmpLevel = 0 To .NumLevels - 1  ' for each level..
            With .Levels.Items(tmpLevel)
                For tmpSegment = 0 To .NumSegments - 1 ' for each segment in level...
                  With .Segments(tmpSegment)
                      For tmp = 0 To .NumPoints ' for each point in segment...
                        ' Convert to screen coordinates...
                        X = TChart1.Series(0).CalcXPosValue(.Points(tmp).X)
                        Y = TChart1.Series(0).CalcYPosValue(.Points(tmp).Y)
            
                        ' Draw point...
                        TChart1.Canvas.Rectangle X - 2, Y - 2, X + 2, Y + 2
                      Next tmp
                  End With
                Next tmpSegment
            End With
        Next tmpLevel
    End With
  End If
End Sub

Private Sub TChart1_OnMarkTipToolGetText(ByVal Tool As Long, Text As String)
Dim tmpLevel As Long, tmpSegment As Long, tmpPoint As Long
  ' Find level and segment under mouse cursor...
  With TChart1.MousePosition
    tmpLevel = TChart1.Series(0).asContour.Levels.clicked(.X, .Y, tmpSegment, tmpPoint)
  End With
  ' If mouse is over a segment line...
  If tmpLevel <> -1 Then
    Text = "Level: " + Str(tmpLevel) + Chr(13) + _
         "Segment: " + Str(tmpSegment) + Chr(13) + _
         "Point: " + Str(tmpPoint)
  Else
    Text = "?"
  End If
End Sub

Private Sub Text2_Change()
Dim v As Integer
  v = val(Text2.Text)
  If Not IsNumeric(Text2.Text) Or v < 1 Or v > 100 Then
    KeepFocus = True
    MsgBox "Please insert a numeric value between 1 and 100", , "Smoothing factor"
  Else
    TChart1.Series(0).asContour.Smoothing.Factor = v
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
