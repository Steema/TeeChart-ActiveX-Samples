VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartGrid_TopLeftChanged 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.ChartGrid ChartGrid1 
      Height          =   5190
      Left            =   0
      OleObjectBlob   =   "ChartGrid_TopLeftChanged.frx":0000
      TabIndex        =   7
      Top             =   1710
      Width           =   2985
   End
   Begin VB.CheckBox Check4 
      Caption         =   "Show &Fields"
      Height          =   330
      Left            =   8655
      TabIndex        =   6
      Top             =   1305
      Value           =   1  'Checked
      Width           =   1905
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Show &Colors"
      Height          =   330
      Left            =   6900
      TabIndex        =   5
      Top             =   1305
      Value           =   1  'Checked
      Width           =   1500
   End
   Begin VB.CheckBox Check2 
      Caption         =   "&Read-only"
      Height          =   330
      Left            =   5400
      TabIndex        =   4
      Top             =   1305
      Width           =   1410
   End
   Begin VB.CheckBox Check1 
      Caption         =   "&Show Labels"
      Height          =   360
      Left            =   4020
      TabIndex        =   3
      Top             =   1290
      Value           =   1  'Checked
      Width           =   1275
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5205
      Left            =   2970
      TabIndex        =   0
      Top             =   1710
      Width           =   8580
      Base64          =   $"ChartGrid_TopLeftChanged.frx":00C5
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Text            =   "ChartGrid_TopLeftChanged.frx":1A1F
      Top             =   0
      Width           =   11505
   End
   Begin VB.Label Label1 
      Caption         =   "lTopLeft"
      Height          =   195
      Left            =   75
      TabIndex        =   2
      Top             =   1380
      Width           =   3420
   End
End
Attribute VB_Name = "ChartGrid_TopLeftChanged"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub ChartGrid1_OnTopLeftChanged()
  Label1.Caption = "TopRow: " & ChartGrid1.TopRow & ", LeftCol: " & ChartGrid1.LeftCol
End Sub

Private Sub Check3_Click()
  ChartGrid1.ShowColors = Check3.Value
End Sub

Private Sub Check4_Click()
  ChartGrid1.ShowFields = Check4.Value
End Sub

Private Sub Command1_Click()

End Sub

Private Sub Form_Load()
  ChartGrid1.Chart = TChart1
  With TChart1
    .Series(0).FillSampleValues (25)
    .Series(1).FillSampleValues (25)
  End With
  ChartGrid1_OnTopLeftChanged
  
  Check1.Visible = False
  ChartGrid1.ShowLabels = False
  ChartGrid1.ShowColors = True
  ChartGrid1.ShowFields = True
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub


