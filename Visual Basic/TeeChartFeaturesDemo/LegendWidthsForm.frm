VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form LegendWidthsForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3645
   ClientTop       =   2295
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5175
      Left            =   0
      TabIndex        =   0
      Top             =   1740
      Width           =   11505
      Base64          =   $"LegendWidthsForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1215
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   8
      Text            =   "LegendWidthsForm.frx":05DE
      Top             =   0
      Width           =   11490
   End
   Begin VB.VScrollBar VScroll2 
      Height          =   315
      Left            =   6060
      Max             =   1
      Min             =   50
      TabIndex        =   5
      Top             =   1290
      Value           =   1
      Width           =   255
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   315
      LargeChange     =   5
      Left            =   3540
      Max             =   1
      Min             =   50
      TabIndex        =   4
      Top             =   1290
      Value           =   1
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Auto widths"
      Height          =   195
      Left            =   120
      TabIndex        =   1
      Top             =   1350
      Width           =   1455
   End
   Begin VB.Label Label5 
      Height          =   255
      Left            =   6360
      TabIndex        =   7
      Top             =   1350
      Width           =   495
   End
   Begin VB.Label Label4 
      Height          =   255
      Left            =   3840
      TabIndex        =   6
      Top             =   1350
      Width           =   435
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Column 2 width:"
      Height          =   195
      Left            =   4800
      TabIndex        =   3
      Top             =   1350
      Width           =   1125
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Column 1 width:"
      Height          =   195
      Left            =   2280
      TabIndex        =   2
      Top             =   1350
      Width           =   1125
   End
End
Attribute VB_Name = "LegendWidthsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Legend.ColumnWidthAuto = Check1.Value
  TChart1.Repaint
End Sub

Private Sub Form_Load()
  'TChart1.Legend.ColumnWidthAuto = true  'default
  TChart1.Series(0).FillSampleValues 10
  VScroll1.Value = 30
  VScroll2.Value = 14
  Label4.Caption = Str$(VScroll1.Value)
  Label5.Caption = Str$(VScroll2.Value)
  TChart1.Legend.ColumnWidthAuto = False
End Sub

Private Sub VScroll1_Change()
  TChart1.Legend.ColumnWidths(0) = VScroll1.Value
  Label4.Caption = Str$(VScroll1.Value)
  TChart1.Repaint
End Sub

Private Sub VScroll2_Change()
  TChart1.Legend.ColumnWidths(1) = VScroll2.Value
  Label5.Caption = Str$(VScroll2.Value)
  TChart1.Repaint
End Sub
