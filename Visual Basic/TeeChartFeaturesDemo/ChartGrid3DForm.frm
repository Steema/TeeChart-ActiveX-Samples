VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartGrid3DForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2820
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Height          =   5145
      Left            =   3630
      TabIndex        =   0
      Top             =   1740
      Width           =   7830
      Base64          =   $"ChartGrid3DForm.frx":0000
   End
   Begin TeeChart.ChartGrid ChartGrid1 
      Height          =   5145
      Left            =   0
      OleObjectBlob   =   "ChartGrid3DForm.frx":075C
      TabIndex        =   3
      Top             =   1740
      Width           =   3615
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Grid 3D Mode"
      Height          =   195
      Left            =   570
      TabIndex        =   2
      Top             =   1440
      Value           =   1  'Checked
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1335
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ChartGrid3DForm.frx":0821
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "ChartGrid3DForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  ChartGrid1.Grid3DMode = Check1.Value = 1
End Sub

Private Sub Form_Load()
  ChartGrid1.Chart = TChart1
  ChartGrid1.ShowColors = True
  
  TChart1.Series(0).FillSampleValues 5
  ChartGrid1.Grid3DMode = True

  ' cosmetic
  ChartGrid1.DefaultColWidth = 38
  ChartGrid1.RecalcDimensions
End Sub
