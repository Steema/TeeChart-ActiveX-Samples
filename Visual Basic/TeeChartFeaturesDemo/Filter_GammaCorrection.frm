VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Filter_GammaCorrection 
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
   Begin VB.CheckBox Check1 
      Caption         =   "Percent"
      Height          =   195
      Left            =   4050
      TabIndex        =   5
      Top             =   1110
      Width           =   1005
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   960
      Max             =   100
      TabIndex        =   3
      Top             =   1080
      Width           =   2025
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5475
      Left            =   0
      TabIndex        =   1
      Top             =   1440
      Width           =   11505
      Base64          =   $"Filter_GammaCorrection.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Filter_GammaCorrection.frx":06A6
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Label2"
      Height          =   195
      Left            =   3090
      TabIndex        =   4
      Top             =   1110
      Width           =   480
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Amount:"
      Height          =   195
      Left            =   270
      TabIndex        =   2
      Top             =   1110
      Width           =   585
   End
End
Attribute VB_Name = "Filter_GammaCorrection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Tools.Items(1).asAntiAlias.Filters.Item(0).asGammaCorrection.Percent = Check1.Value
  TChart1.Repaint
End Sub

Private Sub Form_Load()
  TChart1.Tools.Items(1).asAntiAlias.Filters.Add fcGammaCorrection

  With TChart1.Tools.Items(1).asAntiAlias.Filters.Item(0).asGammaCorrection
    .Amount = 50
    .Percent = False
    HScroll1.Value = .Amount
  End With
  
  Label2.Caption = HScroll1.Value
End Sub

Private Sub HScroll1_Change()
  TChart1.Tools.Items(1).asAntiAlias.Filters.Item(0).asGammaCorrection.Amount = HScroll1.Value
  Label2.Caption = HScroll1.Value
  TChart1.Repaint
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
