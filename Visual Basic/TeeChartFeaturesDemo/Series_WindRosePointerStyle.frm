VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_WindRosePointerStyle 
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
   Begin VB.CheckBox Check1 
      Caption         =   "Use OnGetPointerStyle event"
      Height          =   195
      Left            =   330
      TabIndex        =   2
      Top             =   1110
      Value           =   1  'Checked
      Width           =   2415
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5415
      Left            =   0
      TabIndex        =   1
      Top             =   1500
      Width           =   11505
      Base64          =   $"Series_WindRosePointerStyle.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Series_WindRosePointerStyle.frx":084E
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Series_WindRosePointerStyle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Repaint
End Sub

Private Sub TChart1_OnGetSeriesPointerStyle(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, AStyle As TeeChart.EPointerStyle)
  With TChart1.Series(0).asWindRose
    If Check1.Value Then
      If .RadiusValues.Value(ValueIndex) > 600 Then
        .Pointer.HorizontalSize = 10
        .Pointer.VerticalSize = 10
        AStyle = psCircle
      Else
        .Pointer.HorizontalSize = 4
        .Pointer.VerticalSize = 4
        AStyle = Rnd * 13
      End If
    Else
      AStyle = .Pointer.Style
    End If
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
