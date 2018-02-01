VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form LegendCustomPosForm 
   BorderStyle     =   0  'None
   Caption         =   "LegendCustomPosForm"
   ClientHeight    =   6915
   ClientLeft      =   1935
   ClientTop       =   1920
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5415
      Left            =   0
      TabIndex        =   0
      Top             =   1500
      Width           =   11505
      Base64          =   $"LegendCustomPosForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1035
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   6
      Text            =   "LegendCustomPosForm.frx":0A74
      Top             =   0
      Width           =   11490
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      LargeChange     =   5
      Left            =   2940
      Max             =   1000
      SmallChange     =   2
      TabIndex        =   3
      Top             =   1140
      Value           =   90
      Width           =   1755
   End
   Begin VB.HScrollBar HScroll2 
      Height          =   255
      LargeChange     =   5
      Left            =   5220
      Max             =   1000
      SmallChange     =   2
      TabIndex        =   2
      Top             =   1140
      Value           =   90
      Width           =   1755
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Custom position"
      Height          =   195
      Left            =   120
      TabIndex        =   1
      Top             =   1140
      Value           =   1  'Checked
      Width           =   1575
   End
   Begin VB.Label Label1 
      Caption         =   "Left"
      Height          =   255
      Left            =   2580
      TabIndex        =   5
      Top             =   1140
      Width           =   315
   End
   Begin VB.Label Label2 
      Caption         =   "Top"
      Height          =   255
      Left            =   4860
      TabIndex        =   4
      Top             =   1140
      Width           =   315
   End
End
Attribute VB_Name = "LegendCustomPosForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FirstRepaint As Boolean
Private Sub Check1_Click()
TChart1.Legend.CustomPosition = Check1.Value
TChart1.Repaint
HScroll1.Value = TChart1.Legend.Left
HScroll2.Value = TChart1.Legend.Top
HScroll1.Enabled = Check1.Value
HScroll2.Enabled = Check1.Value
End Sub
Private Sub Form_Load()
FirstRepaint = False
With TChart1
.Series(0).FillSampleValues 7
.Legend.CustomPosition = True
.Legend.Top = 90
.Legend.Left = 90
End With
End Sub
Private Sub HScroll1_Change()
HScroll1_Scroll
End Sub
Private Sub HScroll1_Scroll()
TChart1.Legend.Left = HScroll1.Value
End Sub
Private Sub HScroll2_Change()
HScroll1_Scroll
End Sub
Private Sub HScroll2_Scroll()
TChart1.Legend.Top = HScroll2.Value
End Sub
Private Sub TChart1_OnAfterDraw()
Dim LWidth
LWidth = 0
For i = 0 To 1
LWidth = TChart1.Legend.ColumnWidths(i) + LWidth
Next i
If FirstRepaint = False Then
FirstRepaint = True
HScroll1.Max = TChart1.Canvas.Width - LWidth
HScroll2.Max = TChart1.Canvas.Height - 50
End If
End Sub
