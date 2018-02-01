VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Legend_TextSymbolGap 
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
   Begin VB.TextBox Text4 
      Height          =   285
      Left            =   6810
      TabIndex        =   10
      Text            =   "0"
      Top             =   1800
      Width           =   495
   End
   Begin VB.VScrollBar VScroll3 
      Height          =   285
      Left            =   7320
      Max             =   0
      Min             =   500
      TabIndex        =   9
      Top             =   1800
      Width           =   225
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   3885
      TabIndex        =   7
      Text            =   "14"
      Top             =   2205
      Width           =   495
   End
   Begin VB.VScrollBar VScroll2 
      Height          =   285
      Left            =   4395
      Max             =   0
      Min             =   500
      TabIndex        =   6
      Top             =   2205
      Value           =   14
      Width           =   225
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   3885
      TabIndex        =   4
      Text            =   "30"
      Top             =   1800
      Width           =   495
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   4395
      Max             =   0
      Min             =   500
      TabIndex        =   3
      Top             =   1800
      Value           =   30
      Width           =   225
   End
   Begin VB.CheckBox Check1 
      Caption         =   "&Automatic Widths"
      Height          =   285
      Left            =   270
      TabIndex        =   2
      Top             =   1845
      Value           =   1  'Checked
      Width           =   2040
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4305
      Left            =   0
      TabIndex        =   0
      Top             =   2610
      Width           =   11505
      Base64          =   $"Legend_TextSymbolGap.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1695
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Text            =   "Legend_TextSymbolGap.frx":15C2
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Adjust &gap Symbol-Text:"
      Height          =   195
      Left            =   4860
      TabIndex        =   11
      Top             =   1860
      Width           =   1890
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Column &2 width:"
      Height          =   195
      Left            =   2520
      TabIndex        =   8
      Top             =   2265
      Width           =   1125
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Column &1 width:"
      Height          =   195
      Left            =   2520
      TabIndex        =   5
      Top             =   1860
      Width           =   1215
   End
End
Attribute VB_Name = "Legend_TextSymbolGap"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Legend.ColumnWidthAuto = Check1.Value
  TChart1.Repaint

  Text2.Enabled = Not TChart1.Legend.ColumnWidthAuto
  Text3.Enabled = Not TChart1.Legend.ColumnWidthAuto
  Text4.Enabled = Not TChart1.Legend.ColumnWidthAuto
  
  VScroll1.Enabled = Not TChart1.Legend.ColumnWidthAuto
  VScroll2.Enabled = Not TChart1.Legend.ColumnWidthAuto
  VScroll3.Enabled = Not TChart1.Legend.ColumnWidthAuto

  Text2.Text = TChart1.Legend.ColumnWidths(0)
  Text3.Text = TChart1.Legend.ColumnWidths(1)
  Text4.Text = TChart1.Legend.TextSymbolGap
End Sub

Private Sub Form_Load()
  Check1_Click
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  TChart1.Legend.ColumnWidths(0) = Text2.Text
  TChart1.Repaint
End Sub

Private Sub Text3_Change()
  TChart1.Legend.ColumnWidths(1) = Text3.Text
  TChart1.Repaint
End Sub

Private Sub Text4_Change()
  TChart1.Legend.TextSymbolGap = Text4.Text
  TChart1.Repaint
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = LTrim$(Str$(VScroll1.Value))
End Sub

Private Sub VScroll2_Change()
  VScroll2_Scroll
End Sub

Private Sub VScroll2_Scroll()
  Text3.Text = LTrim$(Str$(VScroll2.Value))
End Sub

Private Sub VScroll3_Change()
  VScroll3_Scroll
End Sub

Private Sub VScroll3_Scroll()
  Text4.Text = LTrim$(Str$(VScroll3.Value))
End Sub

