VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesMouseEnterForm 
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
      Height          =   5295
      Left            =   0
      TabIndex        =   0
      Top             =   1620
      Width           =   11505
      Base64          =   $"SeriesMouseEnterForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "SeriesMouseEnterForm.frx":0AD2
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Height          =   195
      Left            =   435
      TabIndex        =   2
      Top             =   1260
      Width           =   3600
   End
End
Attribute VB_Name = "SeriesMouseEnterForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub TChart1_OnMouseEnterSeries(ByVal SeriesIndex As Long)
Dim clicked As Long
  clicked = TChart1.Series(SeriesIndex).GetMousePoint

  ' Show Series name and point index and value
  Label1.Caption = "Series: " + TChart1.Series(SeriesIndex).Name + _
                 "  point:" + Str(clicked) + _
                 "  value:" + Str(TChart1.Series(SeriesIndex).YValues.Value(clicked))
End Sub

Private Sub TChart1_OnMouseLeaveSeries(ByVal SeriesIndex As Long)
  Label1.Caption = ""
End Sub
