VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "teechart2014.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4830
   ClientLeft      =   3900
   ClientTop       =   2775
   ClientWidth     =   6945
   LinkTopic       =   "Form1"
   ScaleHeight     =   4830
   ScaleWidth      =   6945
   Begin TeeChart.TChart TChart1 
      Height          =   3915
      Left            =   120
      OleObjectBlob   =   "Form1.frx":0000
      TabIndex        =   0
      Top             =   180
      Width           =   6615
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Close"
      Height          =   435
      Left            =   5640
      TabIndex        =   2
      Top             =   4320
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Import from file"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   4260
      Width           =   2115
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
TChart1.Import.LoadFromFile (App.Path + "\areas.tee")

' set Chart size and position...
TChart1.Left = 120
TChart1.Top = 180
TChart1.Width = 6615
TChart1.Height = 3800

' example: Change areas to "Stacked"
TChart1.Series(0).asArea.MultiArea = maStacked

End Sub

Private Sub Command2_Click()
 End
End Sub


