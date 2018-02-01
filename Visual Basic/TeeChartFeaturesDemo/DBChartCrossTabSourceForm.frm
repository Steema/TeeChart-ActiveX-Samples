VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form DBChartCrossTabSourceForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2985
   ClientTop       =   2685
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.CrossTabSource CrossTabSource1 
      Left            =   120
      OleObjectBlob   =   "DBChartCrossTabSourceForm.frx":0000
      Top             =   1080
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   1620
      Width           =   11505
      Base64          =   $"DBChartCrossTabSourceForm.frx":005C
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Swap"
      Height          =   345
      Left            =   5160
      TabIndex        =   4
      Top             =   1080
      Width           =   975
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Open table"
      Height          =   195
      Left            =   600
      TabIndex        =   2
      Top             =   1170
      Width           =   1455
   End
   Begin VB.Frame Frame1 
      Height          =   555
      Left            =   2520
      TabIndex        =   3
      Top             =   960
      Width           =   2235
      Begin VB.OptionButton Option1 
         Caption         =   "Sum"
         Height          =   255
         Index           =   1
         Left            =   1320
         TabIndex        =   6
         Top             =   240
         Value           =   -1  'True
         Width           =   675
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Count"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   5
         Top             =   240
         Width           =   1455
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "DBChartCrossTabSourceForm.frx":02B2
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "DBChartCrossTabSourceForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
Dim tmp As String

  With CrossTabSource1
    tmp = .GroupField
    .GroupField = .LabelField
    .LabelField = tmp
    .Active = Check1.Value = 1
  End With
  TChart1.RefreshData
End Sub

Private Sub Check1_Click()
  CrossTabSource1.Active = Check1.Value = 1
  TChart1.RefreshData
End Sub

Private Sub Form_Load()
  With CrossTabSource1
    .DataSet = "DSN=TeeChart Pro Database; SQL=select * from orders"
    .Series = TChart1.Series(0)
    .GroupField = "Terms"
    .LabelField = "PaymType"
    .ValueField = "AmntPaid"
  End With
End Sub

Private Sub Option1_Click(Index As Integer)
  CrossTabSource1.Formula = IIf(Index = 0, gfCount, gfSum)
  CrossTabSource1.Active = Check1.Value = 1
  TChart1.RefreshData
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
