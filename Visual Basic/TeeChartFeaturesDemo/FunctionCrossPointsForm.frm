VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form FunctionCrossPointsForm 
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
      Height          =   5535
      Left            =   0
      TabIndex        =   0
      Top             =   1380
      Width           =   11505
      Base64          =   $"FunctionCrossPointsForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "View CrossPoints Line"
      Height          =   195
      Left            =   480
      TabIndex        =   2
      Top             =   1080
      Value           =   1  'Checked
      Width           =   1935
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "FunctionCrossPointsForm.frx":0D4A
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "FunctionCrossPointsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(2).Active = Check1.Value = 1
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 25
  TChart1.Series(1).FillSampleValues 25
End Sub
