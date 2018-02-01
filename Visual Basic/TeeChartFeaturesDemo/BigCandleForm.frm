VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form BigCandleForm 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'None
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart2 
      Height          =   5295
      Left            =   9225
      TabIndex        =   2
      Top             =   1635
      Width           =   2280
      Base64          =   $"BigCandleForm.frx":0000
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   1635
      Width           =   9255
      Base64          =   $"BigCandleForm.frx":0824
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "BigCandleForm.frx":1048
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Move the mouse over Candle points..."
      Height          =   315
      Left            =   240
      TabIndex        =   3
      Top             =   1320
      Width           =   2805
   End
End
Attribute VB_Name = "BigCandleForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
  TChart1.Header.Text.Text = "Normal Candle (OHLC) series"
  TChart1.Legend.Visible = False
  TChart1.Aspect.View3D = False
  TChart1.AddSeries scCandle
  TChart1.Series(0).FillSampleValues 20
   
  TChart2.Header.Text.Text = "Big-Candle"
  TChart2.Legend.Visible = False
  TChart2.Aspect.View3D = False
  TChart2.AddSeries scBigCandle
End Sub

Private Sub TChart1_OnMouseMove(ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
  Dim tmp As Integer
  TChart2.Series(0).Clear
  tmp = TChart1.Series(0).clicked(X, Y)
  If tmp <> -1 Then
     With TChart1.Series(0).asCandle
       TChart2.Series(0).asCandle.AddCandle .DateValues.Value(tmp), .OpenValues.Value(tmp), .HighValues.Value(tmp), .LowValues.Value(tmp), .CloseValues.Value(tmp)
    End With
  End If
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
