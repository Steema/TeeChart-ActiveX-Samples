VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Filter_Blur 
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
   Begin VB.HScrollBar HScroll2 
      Height          =   255
      Left            =   4500
      Max             =   100
      TabIndex        =   6
      Top             =   1080
      Width           =   2055
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   930
      Max             =   100
      TabIndex        =   3
      Top             =   1080
      Width           =   2055
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5385
      Left            =   0
      TabIndex        =   1
      Top             =   1530
      Width           =   11505
      Base64          =   $"Filter_Blur.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Filter_Blur.frx":223FC
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Label4"
      Height          =   195
      Left            =   6660
      TabIndex        =   7
      Top             =   1110
      Width           =   480
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Steps:"
      Height          =   195
      Left            =   3930
      TabIndex        =   5
      Top             =   1110
      Width           =   450
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
      Left            =   210
      TabIndex        =   2
      Top             =   1110
      Width           =   585
   End
End
Attribute VB_Name = "Filter_Blur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  TChart1.Panel.BackImage.Filters.Add fcBlur
  
  With TChart1.Panel.BackImage.Filters.Item(0).asBlur
    .Amount = 10
    .Steps = 10
    HScroll1.Value = .Amount
    HScroll2.Value = .Steps
  End With
  
  Label2.Caption = Str$(HScroll1.Value)
  Label4.Caption = Str$(HScroll2.Value)
End Sub

Private Sub HScroll1_Change()
  TChart1.Panel.BackImage.Filters.Item(0).asBlur.Amount = HScroll1.Value
  Label2.Caption = Str$(HScroll1.Value)
  TChart1.Repaint
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub

Private Sub HScroll2_Change()
  TChart1.Panel.BackImage.Filters.Item(0).asBlur.Steps = HScroll2.Value
  Label4.Caption = Str$(HScroll2.Value)
  TChart1.Repaint
End Sub

Private Sub HScroll2_Scroll()
  HScroll2_Change
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
