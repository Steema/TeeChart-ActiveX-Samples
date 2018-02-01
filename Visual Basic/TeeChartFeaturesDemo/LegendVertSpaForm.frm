VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form LegendVertSpaForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3120
   ClientTop       =   1995
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5145
      Left            =   0
      TabIndex        =   0
      Top             =   1770
      Width           =   11505
      Base64          =   $"LegendVertSpaForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1275
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   4
      Text            =   "LegendVertSpaForm.frx":0432
      Top             =   0
      Width           =   11490
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   375
      Left            =   1980
      Max             =   -8
      Min             =   30
      TabIndex        =   2
      Top             =   1320
      Width           =   255
   End
   Begin VB.Label Label3 
      Height          =   255
      Left            =   2400
      TabIndex        =   3
      Top             =   1380
      Width           =   1155
   End
   Begin VB.Label Label2 
      Caption         =   "Legend vertical spacing:"
      Height          =   255
      Left            =   60
      TabIndex        =   1
      Top             =   1380
      Width           =   1815
   End
End
Attribute VB_Name = "LegendVertSpaForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  TChart1.AddSeries scBubble
  TChart1.Series(0).FillSampleValues 9
  VScroll1.Value = 0
  Label3.Caption = Str$(VScroll1.Value)
End Sub

Private Sub VScroll1_Change()
  TChart1.Legend.Vertspacing = VScroll1.Value
  Label3.Caption = Str$(VScroll1.Value)
End Sub
