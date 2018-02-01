VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Axes_DrawBevelsForm 
   Appearance      =   0  'Flat
   BackColor       =   &H80000000&
   BorderStyle     =   0  'None
   Caption         =   "f"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5235
      Left            =   0
      TabIndex        =   0
      Top             =   1680
      Width           =   11505
      Base64          =   $"Axes_DrawBevelsForm.frx":0000
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Axes_DrawBevelsForm.frx":0672
      Left            =   4050
      List            =   "Axes_DrawBevelsForm.frx":067C
      TabIndex        =   5
      Text            =   "Lowered"
      Top             =   1260
      Width           =   1500
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   3240
      TabIndex        =   4
      Text            =   "2"
      Top             =   1260
      Width           =   690
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Draw Bevels around axes"
      Height          =   195
      Left            =   135
      TabIndex        =   2
      Top             =   1305
      Value           =   1  'Checked
      Width           =   2310
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Text            =   "Axes_DrawBevelsForm.frx":0691
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Size :"
      Height          =   195
      Left            =   2715
      TabIndex        =   3
      Top             =   1305
      Width           =   390
   End
End
Attribute VB_Name = "Axes_DrawBevelsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Click()
  TChart1.Repaint
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 0
  With TChart1
    .Series(0).FillSampleValues (5)
    ' Bevels look fine on 2D only.
    .Aspect.View3D = False
    .Axis.Left.AxisPen.Width = 1
    .Axis.Left.MinorTicks.Color = vbBlack
    .Axis.Left.MinorTickLength = 3
    .Axis.Left.Ticks.Color = vbBlack
  End With
End Sub


Private Sub Text2_Change()
    If Text2.Text <> "" Then
      AdjustAxisOffsets
    End If
End Sub

' Change all axes "offsets" to leave space for the bevel.
Private Sub AdjustAxisOffsets()
Dim t, tmpsize As Integer
  If Check1.Value = 1 Then
        tmpsize = Text2.Text
  Else
    tmpsize = 0
  End If
  With TChart1
    .Axis.Left.MinimumOffset = tmpsize
    .Axis.Left.MaximumOffset = tmpsize
    .Axis.Bottom.MinimumOffset = tmpsize
    .Axis.Bottom.MaximumOffset = tmpsize
    .Repaint
  End With
End Sub

' This routine draws a bevel around TeeChart axes
Private Sub DrawBevelAroundAxes(Style As TeeChart.EPanelBevel, Size As Integer)
Dim R As TeeChart.TeeRect
    R.Left = TChart1.Axis.Left.Position
    R.Top = TChart1.Axis.Top.Position
    R.Right = TChart1.Axis.Right.Position
    R.Bottom = TChart1.Axis.Bottom.Position
    TChart1.Canvas.DrawBevel Style, R.Left, R.Top, R.Right, R.Bottom, Size
End Sub

Private Sub TChart1_OnAfterDraw()
  If Check1.Value = 1 Then
    Select Case Combo1.ListIndex
        Case 0: DrawBevelAroundAxes bvLowered, Text2.Text
        Case 1: DrawBevelAroundAxes bvRaised, Text2.Text
    End Select
  End If
End Sub

Private Sub Text1_DblClick()
TChart1.ShowEditor
End Sub

Private Sub Check1_Click()
    TChart1.Repaint
End Sub


