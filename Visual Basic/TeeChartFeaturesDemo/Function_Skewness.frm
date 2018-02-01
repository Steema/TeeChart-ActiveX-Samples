VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Function_Skewness 
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
   Begin TeeChart.TChart TChart1 
      Height          =   5190
      Left            =   0
      TabIndex        =   2
      Top             =   1710
      Width           =   11490
      Base64          =   $"Function_Skewness.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Random !"
      Height          =   375
      Left            =   135
      TabIndex        =   1
      Top             =   1260
      Width           =   1185
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Function_Skewness.frx":1516
      Top             =   0
      Width           =   11730
   End
End
Attribute VB_Name = "Function_Skewness"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
 TChart1.Series(0).Clear
 TChart1.Series(0).FillSampleValues
 TChart1.Panel.Gradient.Visible = False
 TChart1.Walls.Back.Transparent = True
End Sub

Private Sub Form_Load()
  Command1_Click
  
  With TChart1
    ' Sample code
    '.AddSeries scLine
    'With .Series(1)
    '  .SetFunction tfSkewness
    '  .DataSource = TChart1.Series(0)
    '  .CheckDataSource
    'End With
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
