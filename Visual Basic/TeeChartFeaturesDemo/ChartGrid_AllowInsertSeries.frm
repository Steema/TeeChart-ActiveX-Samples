VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartGrid_AllowInsertSeries 
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
      Caption         =   "Allow insert Series"
      Height          =   195
      Left            =   240
      TabIndex        =   3
      Top             =   1200
      Value           =   1  'Checked
      Width           =   1875
   End
   Begin TeeChart.ChartGrid ChartGrid1 
      Height          =   5385
      Left            =   0
      OleObjectBlob   =   "ChartGrid_AllowInsertSeries.frx":0000
      TabIndex        =   2
      Top             =   1500
      Width           =   2430
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5385
      Left            =   2430
      TabIndex        =   1
      Top             =   1500
      Width           =   9045
      Base64          =   $"ChartGrid_AllowInsertSeries.frx":00C5
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "ChartGrid_AllowInsertSeries.frx":01A9
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "ChartGrid_AllowInsertSeries"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  ChartGrid1.AllowInsertSeries = Check1.Value
End Sub

Private Sub Form_Load()
  TChart1.AddSeries scLine
  
  With TChart1
    .Aspect.Chart3DPercent = 30
    .Panel.Gradient.EndColor = vbGrayText
    .Panel.Gradient.Visible = True
  End With
  
  With TChart1.Series(0)
    .FillSampleValues 10
    .Pen.Visible = False
    .asLine.Gradient.Visible = True
  End With

  With ChartGrid1
    .Chart = TChart1
    .AllowInsertSeries = True
    .ShowLabels = False
    .ToolTipText = "KeyRight to insert Series"
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
