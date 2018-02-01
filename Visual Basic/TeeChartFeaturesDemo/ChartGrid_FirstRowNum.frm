VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartGrid_FirstRowNum 
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
   Begin VB.CommandButton Command1 
      Caption         =   "First Row num. ?"
      Height          =   345
      Left            =   1860
      TabIndex        =   4
      Top             =   1170
      Width           =   1515
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show Fields"
      Height          =   195
      Left            =   240
      TabIndex        =   3
      Top             =   1230
      Value           =   1  'Checked
      Width           =   1395
   End
   Begin TeeChart.ChartGrid ChartGrid1 
      Height          =   5265
      Left            =   0
      OleObjectBlob   =   "ChartGrid_FirstRowNum.frx":0000
      TabIndex        =   2
      Top             =   1620
      Width           =   2430
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5265
      Left            =   2460
      TabIndex        =   1
      Top             =   1620
      Width           =   9015
      Base64          =   $"ChartGrid_FirstRowNum.frx":00D1
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "ChartGrid_FirstRowNum.frx":0807
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "ChartGrid_FirstRowNum"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  ChartGrid1.ShowFields = Check1.Value
End Sub

Private Sub Command1_Click()
  MsgBox "Row num. : " + Str(ChartGrid1.FirstRowNum), , "FirstRowNum"
End Sub

Private Sub Form_Load()
  ChartGrid1.Chart = TChart1
  ChartGrid1.ShowXValues = cgsNo

  TChart1.Series(0).Depth = 0
  TChart1.Series(1).Depth = 0
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
