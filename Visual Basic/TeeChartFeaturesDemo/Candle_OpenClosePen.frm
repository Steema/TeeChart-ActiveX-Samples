VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Candle_OpenClosePen 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   5940
      Top             =   1320
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Close Tick"
      Height          =   405
      Left            =   1860
      TabIndex        =   3
      Top             =   1260
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Open Tick"
      Height          =   405
      Left            =   240
      TabIndex        =   2
      Top             =   1260
      Width           =   1575
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"Candle_OpenClosePen.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Candle_OpenClosePen.frx":1B6E
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Candle_OpenClosePen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  cc = TChart1.Series(0).asCandle.OpenTickColor
  CommonDialog1.Color = TChart1.Series(0).asCandle.OpenTickColor
  CommonDialog1.ShowColor
  If CommonDialog1.Color <> cc Then
    TChart1.Series(0).asCandle.OpenTickColor = CommonDialog1.Color
  End If
End Sub

Private Sub Command2_Click()
  cc = TChart1.Series(0).asCandle.CloseTickColor
  CommonDialog1.Color = TChart1.Series(0).asCandle.CloseTickColor
  CommonDialog1.ShowColor
  If CommonDialog1.Color <> cc Then
    TChart1.Series(0).asCandle.CloseTickColor = CommonDialog1.Color
  End If
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues (10)
    .Series(0).asCandle.CandleStyle = csCandleBar

    .Series(0).asCandle.OpenTickColor = vbGreen
    .Series(0).asCandle.CloseTickColor = vbRed

    .Series(0).asCandle.CandleWidth = 15
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
