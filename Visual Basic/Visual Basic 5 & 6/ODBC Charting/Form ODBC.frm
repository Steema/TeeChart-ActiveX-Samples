VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "TeeChart Pro -- ODBC without programming example"
   ClientHeight    =   5205
   ClientLeft      =   3075
   ClientTop       =   2835
   ClientWidth     =   7305
   LinkTopic       =   "Form1"
   ScaleHeight     =   5205
   ScaleWidth      =   7305
   Begin TeeChart.TeeCommander TeeCommander1 
      Height          =   510
      Left            =   0
      OleObjectBlob   =   "Form ODBC.frx":0000
      TabIndex        =   4
      Top             =   0
      Width           =   7305
   End
   Begin TeeChart.TChart TChart1 
      Height          =   4035
      Left            =   0
      OleObjectBlob   =   "Form ODBC.frx":005C
      TabIndex        =   0
      Top             =   510
      Width           =   7305
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Edit Chart..."
      Height          =   435
      Left            =   0
      TabIndex        =   2
      Top             =   4710
      Width           =   1515
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Close"
      Height          =   435
      Left            =   5970
      TabIndex        =   1
      Top             =   4710
      Width           =   1335
   End
   Begin TeeChart.TeeEditor TeeEditor1 
      Left            =   1575
      OleObjectBlob   =   "Form ODBC.frx":03C5
      Top             =   4980
   End
   Begin VB.Label Label1 
      Caption         =   "This Chart is connected to the table EMPLOYEE.DBF"
      Height          =   255
      Left            =   1800
      TabIndex        =   3
      Top             =   4770
      Width           =   4035
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  End
End Sub

Private Sub Command2_Click()
  'TChart1.ShowEditor
  TeeEditor1.ShowEditor
End Sub

Private Sub Form_Load()
' when using less than 256 colors, hide gradient filling...
  TChart1.Panel.Gradient.Visible = TChart1.Canvas.IsScreenHighColor
' Associate TChart1 with TeeCommander1 and TeeEditor1
  TeeCommander1.Chart = TChart1
  TeeEditor1.Chart = TChart1
  ' Disable 'Change datasource' option
  TeeEditor1.Options.DataSource = False
  TeeEditor1.ShowPages.Main = False
  ' Set the TeeCommander Editor to use TeeEditor1 options
  TeeCommander1.Editor = TeeEditor1
End Sub


