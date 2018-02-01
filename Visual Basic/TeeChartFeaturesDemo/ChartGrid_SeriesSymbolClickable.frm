VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartGrid_SeriesSymbolClickable 
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
      Caption         =   "Series Symbol Clickable"
      Height          =   195
      Left            =   240
      TabIndex        =   3
      Top             =   1170
      Value           =   1  'Checked
      Width           =   2175
   End
   Begin TeeChart.ChartGrid ChartGrid1 
      Height          =   5415
      Left            =   0
      OleObjectBlob   =   "ChartGrid_SeriesSymbolClickable.frx":0000
      TabIndex        =   2
      Top             =   1470
      Width           =   2430
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5415
      Left            =   2430
      TabIndex        =   1
      Top             =   1470
      Width           =   9045
      Base64          =   $"ChartGrid_SeriesSymbolClickable.frx":00D1
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "ChartGrid_SeriesSymbolClickable.frx":0871
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "ChartGrid_SeriesSymbolClickable"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  ChartGrid1.SeriesSymbolClickable = Check1.Value
End Sub

Private Sub Form_Load()
  ChartGrid1.Chart = TChart1
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
