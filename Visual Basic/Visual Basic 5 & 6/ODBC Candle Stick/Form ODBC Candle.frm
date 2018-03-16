VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2018.ocx"
Begin VB.Form Form1 
   Caption         =   "TeeChart Pro -- ODBC Financial Candle chart example"
   ClientHeight    =   4560
   ClientLeft      =   2895
   ClientTop       =   2520
   ClientWidth     =   7740
   LinkTopic       =   "Form1"
   ScaleHeight     =   4560
   ScaleWidth      =   7740
   Begin TeeChart.TChart TChart1 
      Height          =   3735
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   7515
      Base64          =   $"Form ODBC Candle.frx":0000
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Edit..."
      Height          =   435
      Left            =   2520
      TabIndex        =   3
      Top             =   4020
      Width           =   1275
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Candle Stick"
      Height          =   315
      Left            =   180
      TabIndex        =   2
      Top             =   4080
      Width           =   2115
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Close"
      Height          =   435
      Left            =   6240
      TabIndex        =   1
      Top             =   4020
      Width           =   1335
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  If Check1.Value Then
     TChart1.Series(0).asCandle.CandleStyle = csCandleStick
  Else
     TChart1.Series(0).asCandle.CandleStyle = csCandleBar
  End If
End Sub

Private Sub Command1_Click()
  End ' quit example
End Sub

Private Sub Command2_Click()
  TChart1.ShowEditor
End Sub

Private Sub Form_Load()
' This Chart shows a Candle Series connected to
' the ODBC sample database.
'
' Click on "Edit" and "Series1" to access the
' datasource dialog.
End Sub


