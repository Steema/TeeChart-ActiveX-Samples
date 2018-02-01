VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartGrid_VisibleColumns 
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
   Begin VB.CheckBox Check4 
      Caption         =   "Show Fields"
      Height          =   195
      Left            =   4620
      TabIndex        =   6
      Top             =   1200
      Value           =   1  'Checked
      Width           =   1515
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Show XValues"
      Height          =   195
      Left            =   3090
      TabIndex        =   5
      Top             =   1200
      Value           =   1  'Checked
      Width           =   1395
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Show Labels"
      Height          =   195
      Left            =   1650
      TabIndex        =   4
      Top             =   1200
      Value           =   1  'Checked
      Width           =   1305
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show Colors"
      Height          =   195
      Left            =   240
      TabIndex        =   3
      Top             =   1200
      Value           =   1  'Checked
      Width           =   1275
   End
   Begin TeeChart.ChartGrid ChartGrid1 
      Height          =   5385
      Left            =   0
      OleObjectBlob   =   "ChartGrid_VisibleColumns.frx":0000
      TabIndex        =   2
      Top             =   1500
      Width           =   4020
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5385
      Left            =   4020
      TabIndex        =   1
      Top             =   1500
      Width           =   7455
      Base64          =   $"ChartGrid_VisibleColumns.frx":00C5
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   30
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "ChartGrid_VisibleColumns.frx":01A9
      Top             =   0
      Width           =   11430
   End
End
Attribute VB_Name = "ChartGrid_VisibleColumns"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  ChartGrid1.ShowColors = Check1.Value
End Sub

Private Sub Check2_Click()
  ChartGrid1.ShowLabels = Check2.Value
End Sub

Private Sub Check3_Click()
  If Check3.Value = 1 Then
    ChartGrid1.ShowXValues = cgsYes
  Else
    ChartGrid1.ShowXValues = cgsNo
 End If
End Sub

Private Sub Check4_Click()
  ChartGrid1.ShowFields = Check4.Value
End Sub

Private Sub Form_Load()
Dim i As Integer
  TChart1.AddSeries scBar
  TChart1.AddSeries scPoint
  
  With TChart1
    .Header.Visible = False
    .Aspect.Chart3DPercent = 15
    .Panel.Gradient.EndColor = RGB(125, 100, 130)
    .Panel.Gradient.Visible = True
    .Legend.Alignment = laBottom
    .Legend.Transparent = True
  End With

  For i = 0 To 5
   TChart1.Series(0).AddXY i, Rnd * 50, "Label " + Str(i), RGB(255, 165, 0)
  Next i
  
  For i = 0 To 5
   TChart1.Series(1).AddXY i, Rnd * 50, "Label " + Str(i), RGB(0, 0, 206)
  Next i
  
  TChart1.Series(0).Pen.Visible = False
  TChart1.Series(1).Pen.Visible = False

  With ChartGrid1
    .Chart = TChart1
    .ShowColors = True
    .ShowLabels = True
    .ShowFields = True
    .ShowXValues = cgsYes
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
