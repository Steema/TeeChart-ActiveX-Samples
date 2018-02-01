VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form AxisOpaqueZoneForm 
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
      Height          =   5325
      Left            =   0
      TabIndex        =   0
      Top             =   1590
      Width           =   11505
      Base64          =   $"AxisOpaqueZoneForm.frx":0000
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   3300
      Max             =   100
      TabIndex        =   2
      Top             =   1230
      Value           =   50
      Width           =   2595
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "AxisOpaqueZoneForm.frx":08F6
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      Caption         =   "Scroll Series:"
      Height          =   195
      Left            =   2220
      TabIndex        =   3
      Top             =   1260
      Width           =   975
   End
End
Attribute VB_Name = "AxisOpaqueZoneForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  With TChart1
    'Fix Label size to avoid Axis repositioning when scrolling across value range
    .Axis.Left.Labels.Size = 30
    .Series(0).FillSampleValues 100
    .Series(1).FillSampleValues 100
    .Series(2).FillSampleValues 100
    .Series(3).FillSampleValues 100
  End With
End Sub

Private Function SeriesRect(ByVal SeriesIndex As Integer, serLeft, serTop, serRight, serBottom As Integer)
Dim axleft, axtop, axright, axbottom As Integer
  With TChart1
    axleft = .Axis.Left.Position
    axright = .Axis.Right.Position
    axtop = .Axis.Top.Position
    axbottom = .Axis.Bottom.Position
    serLeft = axleft
    serRight = axright
    Select Case SeriesIndex
      Case 0
          serBottom = axbottom
          serTop = axbottom - ((axbottom - axtop) / 4)
      Case 1
          serBottom = axbottom - ((axbottom - axtop) / 4)
          serTop = axbottom - ((axbottom - axtop) * 2 / 4)
      Case 2
          serBottom = axbottom - ((axbottom - axtop) * 2 / 4)
          serTop = axbottom - ((axbottom - axtop) * 3 / 4)
      Case 3
          serBottom = axbottom - ((axbottom - axtop) * 3 / 4)
          serTop = axbottom - ((axbottom - axtop))
    End Select
  End With
End Function

Private Sub HScroll1_Change()
Dim i, tmpAxis As Integer
Dim tmp As Double
  With TChart1
    For i = 0 To .SeriesCount - 1
      tmp = (HScroll1.Value - 50) / 100
      tmpAxis = .Series(i).VerticalAxisCustom
      If tmpAxis = -1 Then
        Select Case .Series(i).VerticalAxis
          Case atLeft:
            tmp = tmp * (.Axis.Left.Maximum - .Axis.Left.Minimum)
            .Axis.Left.SetMinMax .Series(i).YValues.Minimum + tmp, .Series(i).YValues.Maximum + tmp
          Case atRight:
            tmp = tmp * (.Axis.Right.Maximum - .Axis.Right.Minimum)
            .Axis.Right.SetMinMax .Series(i).YValues.Minimum + tmp, .Series(i).YValues.Maximum + tmp
        End Select
      Else
         tmp = tmp * (.Axis.Custom(tmpAxis).Maximum - .Axis.Custom(tmpAxis).Minimum)
        .Axis.Custom(tmpAxis).SetMinMax .Series(i).YValues.Minimum + tmp, .Series(i).YValues.Maximum + tmp
      End If
    Next i
  End With
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub

Private Sub TChart1_OnSeriesAfterDrawValues(ByVal SeriesIndex As Long)
  TChart1.Canvas.UnClipRectangle
End Sub

Private Sub TChart1_OnSeriesBeforeDrawValues(ByVal SeriesIndex As Long)
Dim serLeft, serTop, serRight, serBottom As Integer
  SeriesRect SeriesIndex, serLeft, serTop, serRight, serBottom
  TChart1.Canvas.Pen.Color = RGB(64, 128, 128)
  TChart1.Canvas.Brush.Style = bsClear
  TChart1.Canvas.Rectangle CInt(serLeft), CInt(serTop), CInt(serRight), CInt(serBottom)
  TChart1.Canvas.ClipRectangle CInt(serLeft), CInt(serTop) + 1, CInt(serRight), CInt(serBottom) - 1
End Sub

Private Sub Text1_Click()
  TChart1.ShowEditor
End Sub
