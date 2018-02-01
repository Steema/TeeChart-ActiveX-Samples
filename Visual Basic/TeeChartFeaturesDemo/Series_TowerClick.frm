VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Series_TowerClick 
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
      Height          =   5325
      Left            =   0
      TabIndex        =   1
      Top             =   1590
      Width           =   11505
      Base64          =   $"Series_TowerClick.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Series_TowerClick.frx":040A
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Clicked Tower:"
      Height          =   195
      Left            =   300
      TabIndex        =   2
      Top             =   1230
      Width           =   1065
   End
End
Attribute VB_Name = "Series_TowerClick"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim oldIndex As Integer
Dim oldcolor As OLE_COLOR

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 5
  oldIndex = -1
End Sub

Private Sub TChart1_OnClickSeries(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
  Label1.Caption = "Clicked Tower : " + Str$(ValueIndex) + "   X :  " + Str$(FormatNumber(TChart1.Series(0).XValues.Value(ValueIndex), 2)) + "   Y :  " + Str$(FormatNumber(TChart1.Series(0).YValues.Value(ValueIndex))) + "   Z :  " + Str$(FormatNumber(TChart1.Series(0).asTower.ZValue(ValueIndex)))
  
  If ValueIndex <> oldIndex Then
    If oldIndex <> -1 Then
      TChart1.Series(0).PointColor(oldIndex) = oldcolor
    End If
    
    oldcolor = TChart1.Series(0).PointColor(ValueIndex)
    oldIndex = ValueIndex
    
    TChart1.Series(0).PointColor(ValueIndex) = vbRed
  End If
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
