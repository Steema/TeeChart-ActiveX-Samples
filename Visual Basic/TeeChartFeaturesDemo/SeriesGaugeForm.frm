VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form SeriesGaugeForm 
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
      Height          =   5355
      Left            =   0
      TabIndex        =   0
      Top             =   1560
      Width           =   11505
      Base64          =   $"SeriesGaugeForm.frx":0000
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   2160
      Max             =   100
      TabIndex        =   3
      Top             =   1170
      Value           =   100
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   495
      TabIndex        =   2
      Top             =   1125
      Width           =   1200
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "SeriesGaugeForm.frx":05EA
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Label1"
      Height          =   195
      Left            =   4200
      TabIndex        =   4
      Top             =   1200
      Width           =   480
   End
End
Attribute VB_Name = "SeriesGaugeForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.ShowEditor 0
  HScroll1.Min = TChart1.Series(0).asGauge.Minimum
  HScroll1.Max = TChart1.Series(0).asGauge.Maximum
  HScroll1.Value = TChart1.Series(0).asGauge.Value
End Sub

Private Sub Form_Load()
  HScroll1.Value = TChart1.Series(0).asGauge.Value
  HScroll1_Scroll
End Sub

Private Sub HScroll1_Change()
  HScroll1_Scroll
End Sub

Private Sub HScroll1_Scroll()
  Label1.Caption = HScroll1.Value
  TChart1.Series(0).asGauge.Value = HScroll1.Value
End Sub
