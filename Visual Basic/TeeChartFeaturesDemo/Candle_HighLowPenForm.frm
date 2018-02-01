VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Candle_HighLowPenForm 
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
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5415
      Left            =   0
      TabIndex        =   0
      Top             =   1500
      Width           =   11505
      Base64          =   $"Candle_HighLowPenForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Default high-low color"
      Height          =   195
      Left            =   3510
      TabIndex        =   4
      Top             =   1155
      Width           =   2445
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   3
      Text            =   "Candle_HighLowPenForm.frx":0716
      Top             =   0
      Width           =   11460
   End
   Begin VB.CommandButton Command2 
      Caption         =   "High-Low..."
      Height          =   345
      Left            =   1890
      TabIndex        =   2
      Top             =   1080
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Border... --"
      Height          =   345
      Left            =   315
      TabIndex        =   1
      Top             =   1080
      Width           =   1515
   End
End
Attribute VB_Name = "Candle_HighLowPenForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  If Check1.Value = 1 Then TChart1.Series(0).asCandle.HighLowPen.Color = clTeeColor Else TChart1.Series(0).asCandle.HighLowPen.Color = vbBlue
End Sub

Private Sub Command1_Click()
    TChart1.Series(0).asCandle.Pointer.Pen.ShowEditor
End Sub

Private Sub Command2_Click()
    TChart1.Series(0).asCandle.HighLowPen.ShowEditor
End Sub

Private Sub Form_Load()
With TChart1
    .Series(0).FillSampleValues (10)
    .Series(0).asCandle.HighLowPen.Color = vbBlue
    .Series(0).asCandle.HighLowPen.Width = 2
    .Series(0).asCandle.CandleWidth = 8
End With
End Sub
