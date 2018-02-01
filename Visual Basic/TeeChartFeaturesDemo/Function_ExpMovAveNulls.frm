VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Function_ExpMovAveNulls 
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
   Begin VB.CheckBox Check2 
      Caption         =   "Pointers"
      Height          =   255
      Left            =   3600
      TabIndex        =   4
      Top             =   1260
      Width           =   1095
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Ignore Nulls"
      Height          =   255
      Left            =   1800
      TabIndex        =   3
      Top             =   1260
      Value           =   1  'Checked
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Set Nulls"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   1200
      Width           =   1095
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5235
      Left            =   0
      TabIndex        =   1
      Top             =   1680
      Width           =   11505
      Base64          =   $"Function_ExpMovAveNulls.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Function_ExpMovAveNulls.frx":0A08
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Function_ExpMovAveNulls"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  TChart1.Series(1).FunctionType.asExpMovAvg.IgnoreNulls = Check1.Value
End Sub

Private Sub Check2_Click()
  TChart1.Series(1).asLine.Pointer.Visible = Check2.Value
End Sub

Private Sub Command1_Click()
  With TChart1.Series(0)
    .SetNull 0
    .SetNull 4
    .SetNull 8
    .SetNull 9
    .SetNull 10
    .SetNull .Count - 1
  End With
  
  TChart1.Series(1).CheckDataSource
End Sub

Private Sub Form_Load()
  TChart1.Series(0).FillSampleValues 20
  
  TChart1.Series(1).CheckDataSource
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
