VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartGridFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3750
   ClientTop       =   1725
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Height          =   5445
      Left            =   3240
      TabIndex        =   0
      Top             =   1440
      Width           =   8220
      Base64          =   $"ChartGridFormForm.frx":0000
   End
   Begin TeeChart.ChartGrid ChartGrid1 
      Height          =   4965
      Left            =   0
      OleObjectBlob   =   "ChartGridFormForm.frx":05EA
      TabIndex        =   2
      Top             =   1440
      Width           =   3240
   End
   Begin TeeChart.ChartGridNavigator ChartGridNavigator1 
      Height          =   495
      Left            =   30
      OleObjectBlob   =   "ChartGridFormForm.frx":06AF
      TabIndex        =   3
      Top             =   6420
      Width           =   3240
   End
   Begin VB.TextBox Text2 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   225
      Left            =   5760
      TabIndex        =   6
      Top             =   1050
      Width           =   195
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   6540
      Top             =   1020
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show Labels"
      Height          =   195
      Left            =   360
      TabIndex        =   5
      Top             =   1050
      Value           =   1  'Checked
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Series colour      "
      Height          =   335
      Left            =   4500
      TabIndex        =   4
      Top             =   990
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ChartGridFormForm.frx":0702
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "ChartGridFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  ChartGrid1.ShowLabels = Check1.Value
End Sub


Private Sub Command1_Click()
  CommonDialog1.ShowColor
  If CommonDialog1.Color <> 0 Then
    TChart1.Series(0).Color = CommonDialog1.Color
    Text2.BackColor = TChart1.Series(0).Color
  End If
End Sub

Private Sub Form_Load()
  ChartGrid1.Chart = TChart1
  ChartGridNavigator1.Grid = ChartGrid1
  With TChart1.Series(0)
    .Add 32, "John", clTeeColor
    .Add 417, "Anne", clTeeColor
    .Add 65, "Louise", clTeeColor
    .Add 87, "Jeff", clTeeColor
    Text2.BackColor = .Color
  End With
  ChartGrid1.RecalcDimensions
End Sub
