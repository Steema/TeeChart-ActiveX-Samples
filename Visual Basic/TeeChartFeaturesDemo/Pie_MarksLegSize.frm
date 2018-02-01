VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2013.ocx"
Begin VB.Form Pie_MarksLegSize 
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
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   1200
      Max             =   100
      TabIndex        =   2
      Top             =   1020
      Value           =   25
      Width           =   2085
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5505
      Left            =   0
      TabIndex        =   1
      Top             =   1410
      Width           =   11505
      Base64          =   $"Pie_MarksLegSize.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Pie_MarksLegSize.frx":08FA
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Leg size:"
      Height          =   195
      Left            =   420
      TabIndex        =   3
      Top             =   1050
      Width           =   630
   End
End
Attribute VB_Name = "Pie_MarksLegSize"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  With TChart1
    .Aspect.View3D = False
    .Legend.Transparent = True
  End With
  
  With TChart1.Series(0)
    .asPie.Circled = True
    .Marks.Arrow.Color = vbGrayText
    .asPie.PieMarks.LegSize = HScroll1.Value
  End With
End Sub

Private Sub HScroll1_Change()
  TChart1.Series(0).asPie.PieMarks.LegSize = HScroll1.Value
End Sub

Private Sub HScroll1_Scroll()
  HScroll1_Change
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
