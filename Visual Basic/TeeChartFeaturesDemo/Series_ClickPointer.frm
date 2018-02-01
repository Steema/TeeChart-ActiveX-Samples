VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_ClickPointer 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3480
   ClientTop       =   3390
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5355
      Left            =   0
      TabIndex        =   1
      Top             =   1560
      Width           =   11505
      Base64          =   $"Series_ClickPointer.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Series_ClickPointer.frx":0DF2
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Click over the Points..."
      Height          =   195
      Left            =   330
      TabIndex        =   2
      Top             =   1230
      Width           =   1590
   End
End
Attribute VB_Name = "Series_ClickPointer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  TChart1.Canvas.Brush.Style = bsClear
  TChart1.Canvas.Font.Color = vbWhite
  
  Label1.Font.Bold = True
  
  TChart1.Series(0).Name = "Red"
  TChart1.Series(1).Name = "Yellow"
  TChart1.Series(2).Name = "Green"
  
  TChart1.Series(0).Cursor = 2020
  TChart1.Series(1).Cursor = 2020
  TChart1.Series(2).Cursor = 2020
End Sub

Private Sub TChart1_OnClickSeries(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
  TChart1.Repaint
  With TChart1.Series(SeriesIndex)
    Label1.Caption = "Clicked Series:  " + .Name + "     Point:  " + Str$(ValueIndex) + "      X:  " + Str$(FormatNumber(.XValues.Value(ValueIndex), 2)) + "    Y:  " + Str$(FormatNumber(.YValues.Value(ValueIndex), 2))
  End With
  
  TChart1.Canvas.TextOut X, Y, "Clicked"
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
