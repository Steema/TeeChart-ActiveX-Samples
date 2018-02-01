VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form LegendCurrentPageForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2715
   ClientTop       =   3645
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.ChartPageNavigator ChartPageNavigator1 
      Height          =   360
      Left            =   0
      OleObjectBlob   =   "LegendCurrentPageForm.frx":0000
      TabIndex        =   2
      Top             =   1260
      Width           =   4860
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   0
      Top             =   1650
      Width           =   11505
      Base64          =   $"LegendCurrentPageForm.frx":0052
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1215
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "LegendCurrentPageForm.frx":069E
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "LegendCurrentPageForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  ChartPageNavigator1.Chart = TChart1
  With TChart1
    .Series(0).FillSampleValues 100
    .Page.MaxPointsPerPage = 10
    .Legend.CurrentPage = True
  End With
End Sub
