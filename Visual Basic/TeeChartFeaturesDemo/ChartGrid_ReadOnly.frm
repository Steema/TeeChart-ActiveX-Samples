VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartGrid_ReadOnly 
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
      Caption         =   "Read Only"
      Height          =   195
      Left            =   240
      TabIndex        =   3
      Top             =   1170
      Value           =   1  'Checked
      Width           =   1395
   End
   Begin TeeChart.ChartGrid ChartGrid1 
      Height          =   5385
      Left            =   0
      OleObjectBlob   =   "ChartGrid_ReadOnly.frx":0000
      TabIndex        =   2
      Top             =   1470
      Width           =   2430
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5385
      Left            =   2430
      TabIndex        =   1
      Top             =   1500
      Width           =   9045
      Base64          =   $"ChartGrid_ReadOnly.frx":00C5
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "ChartGrid_ReadOnly.frx":01A9
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "ChartGrid_ReadOnly"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  ChartGrid1.ReadOnly = Check1.Value
End Sub

Private Sub Form_Load()
  TChart1.AddSeries scPie

  TChart1.Legend.Visible = False

  TChart1.SetTheme ctExcel, cpPastel

  With TChart1.Series(0)
    .FillSampleValues
    .ColorEachPoint = True
    .asPie.ExplodeBiggest = 25
    .Marks.ArrowLength = 30
    .Marks.Arrow.Color = vbBlack
  End With

  With ChartGrid1
    .Chart = TChart1
    .ReadOnly = True
    .ShowColors = True
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
