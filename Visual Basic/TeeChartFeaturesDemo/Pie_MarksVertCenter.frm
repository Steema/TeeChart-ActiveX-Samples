VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2013.ocx"
Begin VB.Form Pie_MarksVertCenter 
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
      Left            =   2850
      Max             =   100
      TabIndex        =   4
      Top             =   1050
      Value           =   25
      Width           =   2265
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Vert. center"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   1080
      Value           =   1  'Checked
      Width           =   1305
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5475
      Left            =   0
      TabIndex        =   1
      Top             =   1440
      Width           =   11505
      Base64          =   $"Pie_MarksVertCenter.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Pie_MarksVertCenter.frx":084E
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Leg size:"
      Height          =   195
      Left            =   2010
      TabIndex        =   3
      Top             =   1080
      Width           =   630
   End
End
Attribute VB_Name = "Pie_MarksVertCenter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Series(0).asPie.PieMarks.VertCenter = Check1.Value
End Sub

Private Sub Form_Load()
  With TChart1.Series(0)
    .Pen.Style = psDot
    .Marks.Arrow.Color = vbBlack
    .Marks.Arrow.Width = 2
    .asPie.PieMarks.VertCenter = True
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
