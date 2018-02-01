VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form LegendAddTextForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3060
   ClientTop       =   2175
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
      Base64          =   $"LegendAddTextForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Draw text on Legend"
      Height          =   195
      Left            =   180
      TabIndex        =   2
      Top             =   1230
      Value           =   1  'Checked
      Width           =   1935
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "LegendAddTextForm.frx":05DE
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "LegendAddTextForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Repaint
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues (6)
    .Series(0).PointLabel(0) = "one"
    .Series(0).PointLabel(1) = "two"
    .Series(0).PointLabel(2) = "three"
    .Series(0).PointLabel(3) = "four"
    .Series(0).PointLabel(4) = "five'"
    .Series(0).PointLabel(5) = "six"
    .Legend.TextStyle = ltsPlain
  End With
End Sub

Private Sub TChart1_OnAfterDraw()
  If Check1.Value = 1 Then
    With TChart1.Legend.ShapeBounds
      TChart1.Canvas.HorizLine3D .Left, .Right, .Bottom - 30, 0
      TChart1.Canvas.TextAlign = ctaLeft
      TChart1.Canvas.Font.Size = 8
      TChart1.Canvas.Font.Color = vbBlue
      TChart1.Canvas.TextOut .Left + 8, .Bottom - 28, "Additional text"
      TChart1.Canvas.TextOut .Left + 8, .Bottom - 16, "displayed here."
    End With
  End If
End Sub

Private Sub TChart1_OnGetLegendPos(ByVal ItemIndex As Long, X As Long, Y As Long, XColor As Long)
  If Check1.Value = 1 Then
    X = X - 40
    XColor = XColor - 40
  End If
End Sub

Private Sub TChart1_OnGetLegendRect(Left As Long, Top As Long, Right As Long, Bottom As Long)
  If Check1.Value = 1 Then
    Left = Left - 40
    Bottom = Bottom + 30
  End If
End Sub

Private Sub Text1_Change()
  TChart1.ShowEditor
End Sub
