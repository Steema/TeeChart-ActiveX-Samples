VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form TransparencyForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2340
   ClientTop       =   1905
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5325
      Left            =   0
      TabIndex        =   0
      Top             =   1590
      Width           =   11505
      Base64          =   $"TransparencyForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "TransparencyForm.frx":EE36
      Top             =   0
      Width           =   11490
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      LargeChange     =   10
      Left            =   1440
      Max             =   100
      SmallChange     =   5
      TabIndex        =   1
      Top             =   1200
      Width           =   3015
   End
   Begin VB.Label Label2 
      Height          =   255
      Left            =   4560
      TabIndex        =   4
      Top             =   1200
      Width           =   495
   End
   Begin VB.Label Label1 
      Caption         =   "Transparency %:"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   1200
      Width           =   1635
   End
End
Attribute VB_Name = "TransparencyForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 10
  HScroll1.Value = 70
  HScroll1_Scroll
  Label2.Caption = HScroll1.Value & "%"
End Sub

Private Sub HScroll1_Change()
  HScroll1_Scroll
End Sub

Private Sub HScroll1_Scroll()
  With TChart1
    .Legend.Transparency = HScroll1.Value
    .Header.Transparency = HScroll1.Value
    .Walls.Back.Transparency = HScroll1.Value
  End With
  Label2.Caption = HScroll1.Value & "%"
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
