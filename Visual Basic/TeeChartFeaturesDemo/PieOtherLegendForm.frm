VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2013.ocx"
Begin VB.Form PieOtherLegendForm 
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
      TabIndex        =   1
      Top             =   1590
      Width           =   11505
      Base64          =   $"PieOtherLegendForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit Legend..."
      Height          =   345
      Left            =   2970
      TabIndex        =   3
      Top             =   1185
      Width           =   1335
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show ""Other"" legend"
      Height          =   195
      Left            =   600
      TabIndex        =   0
      Top             =   1245
      Value           =   1  'Checked
      Width           =   2175
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "PieOtherLegendForm.frx":0CB2
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "PieOtherLegendForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FirstTime As Boolean

Private Sub Command1_Click()
  TChart1.Series(0).asPie.OtherSlice.Legend.ShowEditorLegend
  TChart1.Repaint
End Sub

Private Sub Check1_Click()
  ' Show / Hide "Other" legend
  TChart1.Series(0).asPie.OtherSlice.Legend.Visible = Check1.Value = 1
End Sub

Private Sub Form_Activate()
    If FirstTime Then
        TChart1.Repaint
        FirstTime = False
    End If
End Sub

Private Sub Form_Load()
  ' add data
  TChart1.Series(0).Add 134, "Google", clTeeColor
  TChart1.Series(0).Add 65, "Yahoo", clTeeColor
  TChart1.Series(0).Add 23, "Altavista", clTeeColor
  TChart1.Series(0).Add 12, "AllTheWeb", clTeeColor
  TChart1.Series(0).Add 9, "Terra", clTeeColor
  TChart1.Series(0).Add 6, "Lycos", clTeeColor
  TChart1.Series(0).Add 3, "Ask Jeeves", clTeeColor
  
  ' prepare "Other" to group values below 10
  TChart1.Series(0).asPie.OtherSlice.Style = poBelowValue
  TChart1.Series(0).asPie.OtherSlice.Value = 10

  ' Display "Other" legend:
  With TChart1.Series(0).asPie.OtherSlice.Legend
    .Visible = True
    .Left = 340
    .Top = 150
  End With
  FirstTime = True
End Sub

Private Sub TChart1_OnAfterDraw()
Dim tmpX As Integer
  ' cosmetic line from normal legend to "other" legend

  If TChart1.Series(0).asPie.OtherSlice.Legend.Visible Then
      With TChart1.Canvas
        .Pen.Style = psDot
        .Pen.Width = 2
        .Pen.Color = vbBlue

        tmpX = TChart1.Legend.Left

        .MoveTo tmpX, TChart1.Legend.ShapeBounds.Bottom - 4
        .LineTo tmpX - 12, TChart1.Legend.ShapeBounds.Bottom
        .LineTo tmpX - 12, TChart1.Series(0).asPie.OtherSlice.Legend.Top + 4
        .LineTo TChart1.Series(0).asPie.OtherSlice.Legend.Left, _
                TChart1.Series(0).asPie.OtherSlice.Legend.Top + 4
      End With
  End If
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
