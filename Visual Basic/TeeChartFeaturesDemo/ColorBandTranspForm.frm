VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ColorBandTranspForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3045
   ClientTop       =   2820
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5445
      Left            =   0
      TabIndex        =   0
      Top             =   1470
      Width           =   11505
      Base64          =   $"ColorBandTranspForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   6180
      TabIndex        =   5
      Top             =   990
      Width           =   855
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Draw behind"
      Height          =   195
      Left            =   4500
      TabIndex        =   4
      Top             =   1050
      Width           =   1275
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   1500
      Max             =   100
      TabIndex        =   2
      Top             =   1020
      Value           =   50
      Width           =   2775
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ColorBandTranspForm.frx":034C
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Transparency:"
      Height          =   195
      Left            =   360
      TabIndex        =   3
      Top             =   1020
      Width           =   1020
   End
End
Attribute VB_Name = "ColorBandTranspForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Tools.Items(0).asColorband.DrawBehind = Check1.Value
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 10
    With .Tools.Items(0).asColorband
      .EndValue = TChart1.Series(0).YValues.Maximum - 40
      .StartValue = TChart1.Series(0).YValues.Minimum + 40
    End With
    End With
End Sub

Private Sub HScroll1_Change()
  TChart1.Tools.Items(0).asColorband.Transparency = HScroll1.Value
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub
