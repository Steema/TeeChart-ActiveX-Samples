VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form CandleCustomColorsForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3015
   ClientTop       =   3360
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5685
      Left            =   0
      TabIndex        =   0
      Top             =   1230
      Width           =   11505
      Base64          =   $"CandleCustomColorsForm.frx":0000
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "CandleCustomColorsForm.frx":06F8
      Left            =   3000
      List            =   "CandleCustomColorsForm.frx":0705
      TabIndex        =   4
      Text            =   "Bar"
      Top             =   780
      Width           =   1515
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Custom colours"
      Height          =   195
      Left            =   360
      TabIndex        =   2
      Top             =   840
      Value           =   1  'Checked
      Width           =   1635
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   675
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "CandleCustomColorsForm.frx":0720
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      Caption         =   "Style:"
      Height          =   195
      Left            =   2520
      TabIndex        =   3
      Top             =   840
      Width           =   435
   End
End
Attribute VB_Name = "CandleCustomColorsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
Dim t As Integer
  If Check1.Value = 1 Then
    SetCustomColors
  Else
    'reset colors to default...
    With TChart1.Series(0)
      For t = 0 To .Count - 1
        .PointColor(t) = clTeeColor
      Next t
    End With
  End If
End Sub

Private Sub Combo1_Click()
  With TChart1.Series(0)
    Select Case Combo1.ListIndex
      Case 0: .asCandle.CandleStyle = csCandleStick
      Case 1: .asCandle.CandleStyle = csCandleBar
      Case 2: .asCandle.CandleStyle = csOpenClose
    End Select
  End With
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 30
  TChart1.Series(0).asCandle.CandleStyle = csCandleBar
  SetCustomColors
End Sub

Private Function SetCustomColors()
  With TChart1.Series(0)
    .PointColor(11) = vbYellow
    .PointColor(15) = vbCyan
    .PointColor(16) = vbBlue
  End With
End Function
