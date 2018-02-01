VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2015.ocx"
Begin VB.Form FunctionCustomForm 
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
      Align           =   2  'Align Bottom
      Height          =   4965
      Left            =   0
      TabIndex        =   0
      Top             =   1950
      Width           =   11505
      Base64          =   $"FunctionCustomForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   480
      TabIndex        =   2
      Top             =   1545
      Width           =   975
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1455
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "FunctionCustomForm.frx":0E48
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "FunctionCustomForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub UpdateChart()
  'Force the recalculation function
  TChart1.Series(0).FunctionType.BeginUpdate
  TChart1.Series(0).FunctionType.EndUpdate
End Sub

Private Sub Command1_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Form_Load()
  UpdateChart
End Sub

Private Sub TChart1_OnFunctionCalculate(ByVal SeriesIndex As Long, ByVal X As Double, Y As Double)
  Y = Sin(X / 10)
End Sub
