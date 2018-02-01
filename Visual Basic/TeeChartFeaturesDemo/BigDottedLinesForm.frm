VERSION 5.00
Object = "{EB7A6012-79A9-4A1A-91AF-F2A92FCA3406}#1.0#0"; "TeeChart8.ocx"
Begin VB.Form CanvasDotPenForm 
   BorderStyle     =   0  'None
   Caption         =   "BigDottedLinesForm"
   ClientHeight    =   6915
   ClientLeft      =   2385
   ClientTop       =   2235
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   3735
      Left            =   0
      OleObjectBlob   =   "BigDottedLinesForm.frx":0000
      TabIndex        =   0
      Top             =   1950
      Width           =   7050
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1275
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   4
      Text            =   "BigDottedLinesForm.frx":00B0
      Top             =   0
      Width           =   11490
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   495
      LargeChange     =   2
      Left            =   2460
      Max             =   1
      Min             =   20
      TabIndex        =   3
      Top             =   1380
      Value           =   3
      Width           =   375
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Dotted"
      Height          =   375
      Left            =   0
      TabIndex        =   1
      Top             =   1440
      Width           =   855
   End
   Begin VB.Label Label1 
      Caption         =   "Width"
      Height          =   255
      Left            =   3000
      TabIndex        =   2
      Top             =   1560
      Width           =   855
   End
End
Attribute VB_Name = "CanvasDotPenForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  With TChart1
    If Check1.Value = 1 Then
      .Series(0).asLine.LinePen.Style = psDot
      .Series(1).asLine.LinePen.Style = psDot
      .Series(2).asLine.LinePen.Style = psDot
      .Series(3).asLine.LinePen.Style = psDot
    Else
      .Series(0).asLine.LinePen.Style = psSolid
      .Series(1).asLine.LinePen.Style = psSolid
      .Series(2).asLine.LinePen.Style = psSolid
      .Series(3).asLine.LinePen.Style = psSolid
    End If
  End With
End Sub
Private Sub Form_Load()
Dim i
  With TChart1
    .AddSeries scLine
    .AddSeries scLine
    .AddSeries scLine
    .AddSeries scLine
    For i = 0 To 19
      For j = 0 To .SeriesCount - 1
        .Series(j).Add Rnd * (j + 1) * 4, "", clTeeColor
      Next j
    Next i
    .Legend.CheckBoxes = True
  End With
  Check1.Value = 1
  Label1.Caption = "Width " & Str$(VScroll1.Value)
  VScroll1_Change
End Sub

Private Sub VScroll1_Change()
  Label1.Caption = "Width " & Str$(VScroll1.Value)
  With TChart1
    .Series(0).asLine.LinePen.Width = VScroll1.Value
    .Series(1).asLine.LinePen.Width = VScroll1.Value
    .Series(2).asLine.LinePen.Width = VScroll1.Value
    .Series(3).asLine.LinePen.Width = VScroll1.Value
  End With
End Sub
