VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartEditor_PageNum 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3660
   ClientTop       =   2025
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.ChartPageNavigator ChartPageNavigator1 
      Height          =   300
      Left            =   1980
      OleObjectBlob   =   "ChartEditor_PageNum.frx":0000
      TabIndex        =   2
      Top             =   1020
      Width           =   5040
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5505
      Left            =   0
      TabIndex        =   1
      Top             =   1410
      Width           =   11505
      Base64          =   $"ChartEditor_PageNum.frx":0053
   End
   Begin TeeChart.TeeEditor TeeEditor1 
      Left            =   1500
      OleObjectBlob   =   "ChartEditor_PageNum.frx":0673
      Top             =   960
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit Paging"
      Height          =   345
      Left            =   180
      TabIndex        =   3
      Top             =   990
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   915
      Left            =   30
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "ChartEditor_PageNum.frx":06CF
      Top             =   30
      Width           =   11430
   End
End
Attribute VB_Name = "ChartEditor_PageNum"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TeeEditor1.DefaultPage = epPaging
  TeeEditor1.ShowEditor
End Sub

Private Sub Form_Load()
  TeeEditor1.Chart = TChart1
  ChartPageNavigator1.Chart = TChart1
  TChart1.Series(0).FillSampleValues 25
End Sub
