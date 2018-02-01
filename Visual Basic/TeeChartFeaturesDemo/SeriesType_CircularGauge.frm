VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesType_CircularGauge 
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
   Begin VB.HScrollBar HScroll3 
      Height          =   255
      Left            =   7830
      Max             =   360
      TabIndex        =   5
      Top             =   870
      Width           =   1545
   End
   Begin VB.HScrollBar HScroll2 
      Height          =   255
      Left            =   5490
      Max             =   360
      TabIndex        =   4
      Top             =   870
      Width           =   1545
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   1830
      Max             =   100
      TabIndex        =   3
      Top             =   870
      Width           =   2085
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   375
      Left            =   240
      TabIndex        =   2
      Top             =   810
      Width           =   1245
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5685
      Left            =   0
      TabIndex        =   1
      Top             =   1230
      Width           =   11505
      Base64          =   $"SeriesType_CircularGauge.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   705
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "SeriesType_CircularGauge.frx":1852
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Angle:"
      Height          =   195
      Left            =   7320
      TabIndex        =   8
      Top             =   900
      Width           =   450
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Rotation:"
      Height          =   195
      Left            =   4770
      TabIndex        =   7
      Top             =   900
      Width           =   645
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Label1"
      Height          =   195
      Left            =   3960
      TabIndex        =   6
      Top             =   900
      Width           =   480
   End
End
Attribute VB_Name = "SeriesType_CircularGauge"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Form_Load()
  TChart1.Series(0).asCircularGauge.Value = Rnd * 100

  HScroll1.Value = Round(TChart1.Series(0).asCircularGauge.Value)
  Label1.Caption = Str(HScroll1.Value)
  HScroll2.Value = TChart1.Series(0).asCircularGauge.RotationAngle
  HScroll3.Value = TChart1.Series(0).asCircularGauge.TotalAngle
End Sub

Private Sub HScroll1_Change()
  Label1.Caption = Str(HScroll1.Value)
  TChart1.Series(0).asCircularGauge.Value = HScroll1.Value
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub

Private Sub HScroll2_Change()
  TChart1.Series(0).asCircularGauge.RotationAngle = HScroll2.Value
End Sub

Private Sub HScroll2_Scroll()
  HScroll2_Change
End Sub

Private Sub HScroll3_Change()
  TChart1.Series(0).asCircularGauge.TotalAngle = HScroll3.Value
End Sub

Private Sub HScroll3_Scroll()
  HScroll3_Change
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
