VERSION 5.00
Object = "{EB7A6012-79A9-4A1A-91AF-F2A92FCA3406}#1.0#0"; "teechart8.ocx"
Begin VB.Form ChartGrid_NullPoints
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
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   4785
      Left            =   0
      TabIndex        =   1
      Top             =   1425
      Width           =   11490
      Base64          =   $"ChartGrid_NullPoints.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   855
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "ChartGrid_NullPoints"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
