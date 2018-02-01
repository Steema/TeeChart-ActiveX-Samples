VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form CanvasDotPenForm 
   BorderStyle     =   0  'None
   Caption         =   "CanvasDotPenForm"
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
      Height          =   5475
      Left            =   0
      TabIndex        =   0
      Top             =   1440
      Width           =   11505
      Base64          =   $"CanvasDotPenForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   885
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   4
      Text            =   "CanvasDotPenForm.frx":0458
      Top             =   0
      Width           =   11460
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   405
      LargeChange     =   2
      Left            =   1830
      Max             =   1
      Min             =   20
      TabIndex        =   3
      Top             =   990
      Value           =   3
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Dotted"
      Height          =   195
      Left            =   360
      TabIndex        =   1
      Top             =   1080
      Width           =   855
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Width"
      Height          =   195
      Left            =   2160
      TabIndex        =   2
      Top             =   1080
      Width           =   420
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
