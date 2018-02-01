VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Function_MedianForm 
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
      Align           =   2  'Align Bottom
      Height          =   5715
      Left            =   0
      TabIndex        =   0
      Top             =   1200
      Width           =   11505
      Base64          =   $"Function_MedianForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Function_MedianForm.frx":126C
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Function_MedianForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
With TChart1
    .Aspect.View3D = False
    .AddSeries scFastLine
    .Series(0).FillSampleValues (15)
    .AddSeries scLine
    .Series(1).SetFunction tfMedian
    .Series(1).DataSource = "Series0"
    .Series(1).CheckDataSource
    .Series(1).Title = "Median"
    .Legend.LegendStyle = lsSeries
End With
End Sub

Private Sub Text1_DblClick()
    TChart1.ShowEditor
End Sub


