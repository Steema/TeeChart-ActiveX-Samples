VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2014.ocx"
Begin VB.Form Form1 
   Caption         =   "TeeChart-ActiveX Visual Basic Example"
   ClientHeight    =   5055
   ClientLeft      =   1530
   ClientTop       =   1425
   ClientWidth     =   6225
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5055
   ScaleWidth      =   6225
   Begin TeeChart.TChart TChart1 
      Height          =   3825
      Left            =   60
      OleObjectBlob   =   "fmanual.frx":0000
      TabIndex        =   0
      Top             =   600
      Width           =   6075
   End
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   510
      Left            =   60
      OleObjectBlob   =   "fmanual.frx":0401
      TabIndex        =   5
      Top             =   90
      Width           =   6075
   End
   Begin VB.CommandButton Command4 
      Caption         =   "4) Print Form"
      Height          =   495
      Left            =   4635
      TabIndex        =   4
      Top             =   4515
      Width           =   1500
   End
   Begin VB.CommandButton Command3 
      Caption         =   "3) Show Editor"
      Height          =   495
      Left            =   3150
      TabIndex        =   3
      Top             =   4515
      Width           =   1440
   End
   Begin VB.CommandButton Command2 
      Caption         =   "2) Change Scales"
      Height          =   495
      Left            =   1620
      TabIndex        =   2
      Top             =   4515
      Width           =   1485
   End
   Begin VB.CommandButton Command1 
      Caption         =   "1) Add points"
      Height          =   495
      Left            =   60
      TabIndex        =   1
      Top             =   4515
      Width           =   1515
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  With TChart1.Series(0)
  ' remove previous existing points from the Series
    .Clear
    
  ' add new points to the Series...
    .Add 100, "Europe", vbRed
    .Add 300, "USA", vbBlue
    .Add 200, "Asia", vbGreen
    .Add 120, "Australia", vbYellow
  End With
End Sub


Private Sub Command2_Click()
' change axis scales...
  TChart1.Axis.Left.SetMinMax -100, 1000
End Sub


Private Sub Command3_Click()
' show the Editor dialog...
  TChart1.ShowEditor
End Sub


Private Sub Command4_Click()
  Form1.PrintForm
End Sub

Private Sub Form_Load()
' Associate TChart with TeeCommander1
  TeeCommander1.Chart = TChart1
End Sub






