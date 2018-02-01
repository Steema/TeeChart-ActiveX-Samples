VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartGrid_Colors 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3885
   ClientTop       =   2175
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Height          =   5535
      Left            =   3240
      TabIndex        =   4
      Top             =   1350
      Width           =   8220
      Base64          =   $"ChartGrid_Colors.frx":0000
   End
   Begin TeeChart.ChartGrid ChartGrid1 
      Height          =   5055
      Left            =   0
      OleObjectBlob   =   "ChartGrid_Colors.frx":0612
      TabIndex        =   3
      Top             =   1350
      Width           =   3240
   End
   Begin TeeChart.ChartGridNavigator ChartGridNavigator1 
      Height          =   465
      Left            =   0
      OleObjectBlob   =   "ChartGrid_Colors.frx":06D7
      TabIndex        =   2
      Top             =   6450
      Width           =   3240
   End
   Begin VB.CheckBox Check3 
      Caption         =   "Edit mode"
      Height          =   195
      Left            =   4020
      TabIndex        =   6
      Top             =   1020
      Value           =   1  'Checked
      Width           =   1455
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show Fields"
      Height          =   195
      Left            =   360
      TabIndex        =   5
      Top             =   1020
      Value           =   1  'Checked
      Width           =   1575
   End
   Begin VB.CheckBox Check2 
      Caption         =   "Show Colours"
      Height          =   195
      Left            =   2160
      TabIndex        =   1
      Top             =   1020
      Value           =   1  'Checked
      Width           =   1515
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "ChartGrid_Colors.frx":072A
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ChartGrid_Colors"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  ChartGrid1.ShowFields = Check1.Value
End Sub

Private Sub Check2_Click()
  ChartGrid1.ShowColors = Check2.Value
End Sub

Private Sub Check3_Click()
  ChartGrid1.EditorMode = Check3.Value
  ChartGridNavigator1.EnableButtons
End Sub

Private Sub Form_Load()
  ChartGrid1.Chart = TChart1
  ChartGridNavigator1.Grid = ChartGrid1
  ChartGrid1.ShowColors = True
  ChartGrid1.ShowFields = True
  With TChart1.Series(0)
    .Add 32, "John", clTeeColor
    .Add 417, "Anne", clTeeColor
    .Add 65, "Louise", clTeeColor
    .Add 87, "Jeff", clTeeColor
  End With
  ChartGrid1.RecalcDimensions
End Sub

