VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form CandleOpenCloseForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2715
   ClientTop       =   2370
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   0
      Top             =   1650
      Width           =   11505
      Base64          =   $"CandleOpenCloseForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "3D"
      Height          =   255
      Left            =   4680
      TabIndex        =   6
      Top             =   1200
      Value           =   1  'Checked
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Candle style"
      Height          =   555
      Left            =   0
      TabIndex        =   2
      Top             =   1020
      Width           =   4395
      Begin VB.OptionButton Option1 
         Caption         =   "OpenClose"
         Height          =   255
         Index           =   2
         Left            =   3000
         TabIndex        =   5
         Top             =   240
         Width           =   1215
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Bar"
         Height          =   255
         Index           =   1
         Left            =   1740
         TabIndex        =   4
         Top             =   240
         Value           =   -1  'True
         Width           =   855
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Stick"
         Height          =   255
         Index           =   0
         Left            =   300
         TabIndex        =   3
         Top             =   240
         Width           =   855
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   30
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "CandleOpenCloseForm.frx":06F8
      Top             =   0
      Width           =   11430
   End
End
Attribute VB_Name = "CandleOpenCloseForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Aspect.View3D = Check1.Value
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 30
End Sub

Private Sub Option1_Click(Index As Integer)
  With TChart1.Series(0)
    Select Case Index
      Case 0: .asCandle.CandleStyle = csCandleStick
      Case 1: .asCandle.CandleStyle = csCandleBar
      Case 2: .asCandle.CandleStyle = csOpenClose
    End Select
  End With
End Sub
