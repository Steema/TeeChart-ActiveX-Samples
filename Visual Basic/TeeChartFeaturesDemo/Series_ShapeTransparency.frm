VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2013.ocx"
Begin VB.Form Series_ShapeTransparency 
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
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Series_ShapeTransparency.frx":0000
      Left            =   7590
      List            =   "Series_ShapeTransparency.frx":000D
      Style           =   2  'Dropdown List
      TabIndex        =   7
      Top             =   1200
      Width           =   1335
   End
   Begin VB.HScrollBar HScroll2 
      Height          =   255
      Left            =   5040
      Max             =   100
      TabIndex        =   3
      Top             =   1230
      Value           =   50
      Width           =   1335
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   2280
      Max             =   100
      TabIndex        =   2
      Top             =   1230
      Value           =   50
      Width           =   1335
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   1620
      Width           =   11505
      Base64          =   $"Series_ShapeTransparency.frx":002A
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Series_ShapeTransparency.frx":0C8A
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   " 100     Shape 2:  0"
      Height          =   195
      Left            =   3600
      TabIndex        =   6
      Top             =   1260
      Width           =   1365
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "100       Front:"
      Height          =   195
      Left            =   6480
      TabIndex        =   5
      Top             =   1260
      Width           =   990
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Transparency:     Shape 1:  0"
      Height          =   195
      Left            =   120
      TabIndex        =   4
      Top             =   1260
      Width           =   2070
   End
End
Attribute VB_Name = "Series_ShapeTransparency"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Change()
  Select Case Combo1.ListIndex
    Case 0:
      If (TChart1.Series(2).SeriesType = scShape) Then
        If TChart1.Series(2).asShape.Style = chasRectangle Then
          If (TChart1.Series(1).SeriesType = scShape) Then
            TChart1.ExchangeSeries 2, 1
          Else
            TChart1.ExchangeSeries 2, 0
          End If
        End If
      Else
        If (TChart1.Series(1).asShape.Style = chasCircle) Then
          TChart1.ExchangeSeries 2, 1
        Else
          TChart1.ExchangeSeries 2, 0
        End If
      End If
    Case 1:
      If (TChart1.Series(2).SeriesType = scShape) Then
        If (TChart1.Series(1).SeriesType = scShape) Then
            TChart1.ExchangeSeries 2, 0
        Else
            TChart1.ExchangeSeries 2, 1
        End If
      End If
    Case 2:
      If (TChart1.Series(2).SeriesType = scShape) Then
        If TChart1.Series(2).asShape.Style = chasCircle Then
          If (TChart1.Series(1).SeriesType = scShape) Then
            TChart1.ExchangeSeries 2, 1
          Else
            TChart1.ExchangeSeries 2, 0
          End If
        End If
      Else
        If (TChart1.Series(1).asShape.Style = chasRectangle) Then
          TChart1.ExchangeSeries 2, 1
        Else
          TChart1.ExchangeSeries 2, 0
        End If
      End If
  End Select
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 0
  TChart1.Series(1).asShape.Transparency = 50
  TChart1.Series(2).asShape.Transparency = 50
End Sub

Private Sub HScroll1_Change()
Dim i As Integer

  For i = 0 To TChart1.SeriesCount - 1
    If (TChart1.Series(i).SeriesType = scShape) Then
      If (TChart1.Series(i).asShape.Style = chasRectangle) Then
        TChart1.Series(i).asShape.Transparency = HScroll1.Value
      End If
    End If
  Next i
End Sub

Private Sub HScroll2_Change()
Dim i As Integer

  For i = 0 To TChart1.SeriesCount - 1
    If (TChart1.Series(i).SeriesType = scShape) Then
      If (TChart1.Series(i).asShape.Style = chasCircle) Then
        TChart1.Series(i).asShape.Transparency = HScroll2.Value
      End If
    End If
  Next i
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
